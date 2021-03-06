package com.dotv.perfume.controller.user;

import com.dotv.perfume.controller.BaseController;
import com.dotv.perfume.dto.ProductInBillDTO;
import com.dotv.perfume.dto.UserDTO;
import com.dotv.perfume.entity.Bill;
import com.dotv.perfume.entity.User;
import com.dotv.perfume.repository.BillDetailRepository;
import com.dotv.perfume.repository.BillRepository;
import com.dotv.perfume.repository.UserRepository;
import com.dotv.perfume.service.BillService;
import com.dotv.perfume.service.UserService;
import com.dotv.perfume.utils.Pager;
import com.dotv.perfume.utils.PerfumeUtils;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/per")
public class AccountController extends BaseController {
    //Số phần tử hiển thị 1 trang
    private static final int BUTTONS_TO_SHOW = 5;

    @Autowired
    UserService userService;
    @Autowired
    UserRepository userRepository;
    @Autowired
    BillRepository billRepository;

    @Autowired
    BillRepository useRepository;

    @Autowired
    PerfumeUtils perfumeUtils;

    @Autowired
    BillDetailRepository billDetailRepository;
    @Autowired
    BillService billService;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Value("${user.page.order}")
    int page;


    @GetMapping("/manage_acc")
    public String getAccManage(Model model) throws Exception {
        User user = getUserLogined();
        model.addAttribute("acc",user);
        return "user/account/manage_acc";
    }

    @GetMapping("/update_acc")
    public String getUpdateAcc(Model model) throws Exception {
        User user = getUserLogined();
        model.addAttribute("acc",user);
        return "user/account/update_acc";
    }

    @PostMapping("/update_account")
    public String updateAcc(@ModelAttribute User user, Model model) throws Exception {
        User userLogin = getUserLogined();
        model.addAttribute("acc",userLogin);
//        if(userRepository.findByIdAndUsername(user.getId(),user.getUsername()).size()!=0){
//            model.addAttribute("errorUser","Tên đăng nhập đã tồn tại!");
//            model.addAttribute("acc",user);
//            return "user/account/update_acc";
//        }
        if(userRepository.findByIdAndPhone(user.getId(),user.getPhone()).size()!=0){
            model.addAttribute("errorUser","Số điện thoại đã tồn tại!");
            model.addAttribute("acc",user);
            return "user/account/update_acc";
        }

        User userBD = userService.getUserById(user.getId());
        userBD.setFullName(user.getFullName());
        //userBD.setUsername(user.getUsername());
        userBD.setPhone(user.getPhone());
        userBD.setAddress(user.getAddress());

        userService.saveOrUpdate(userBD);
        model.addAttribute("type",1);
        model.addAttribute("acc", user);
        model.addAttribute("isLogined",true);
        model.addAttribute("userLogined",user);
        return "user/account/update_acc";
    }

    @GetMapping("/update_pass")
    public String getUpdatePass(Model model) throws Exception {
        User userLogin = getUserLogined();
        model.addAttribute("acc",userLogin);
        return "user/account/update_pass";
    }

    @PostMapping("/update_password")
    public String getUpdatePassword(UserDTO userDTO, Model model) throws Exception {
        User userLogined = getUserLogined();
        //BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
        boolean isPass = bCryptPasswordEncoder.matches(userDTO.getOldPassword().trim(),userLogined.getPassword());//Kiểm tra pass có chính xác
        if(!isPass){
            model.addAttribute("errorUser","Mật khẩu cũ không chính xác!");
        }
        else {
            userLogined.setPassword(new BCryptPasswordEncoder().encode((userDTO.getPassword().trim())));
            userService.saveOrUpdate(userLogined);
            model.addAttribute("type", 1);
        }
        model.addAttribute("acc",userLogined);
        return "user/account/update_pass";
    }

    @GetMapping("/order_acc")
    public String getOrderAcc(@RequestParam int curPage, @RequestParam(required = false) String id, Model model) throws Exception {
        model.addAttribute("idBuy",id);
        User user = getUserLogined();
        //sắp xếp theo ngày mới nhất
        List<Bill> bills = billService.getBillByUser(getUserLogined().getId()).stream()
                        .sorted(Comparator.nullsLast((e1, e2) -> e2.getCreatedDate().compareTo(e1.getCreatedDate())))
                        .skip((curPage-1)*page).limit(page).collect(Collectors.toList());


        int totalPage=(int)Math.ceil(bills.size()/(float)page);
        Pager pager = new Pager(totalPage,curPage-1, BUTTONS_TO_SHOW);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("curPage", curPage);
        model.addAttribute("pager",pager);
        model.addAttribute("acc",user);
        model.addAttribute("bills",bills);
        return "user/account/order_acc";
    }

    @PostMapping("/product_in_bill")
    public ResponseEntity<List<ProductInBillDTO>> getProInBill(@RequestParam int idBill){
        return ResponseEntity.ok( billDetailRepository.getListProductInBill(idBill));
    }
}
