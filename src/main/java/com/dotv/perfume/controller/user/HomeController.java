package com.dotv.perfume.controller.user;

import com.dotv.perfume.controller.BaseController;
import com.dotv.perfume.entity.Product;
import com.dotv.perfume.entity.Trademark;
import com.dotv.perfume.service.ProductService;
import com.dotv.perfume.service.TrademarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Controller
//@RequestMapping("/")
public class HomeController extends BaseController {
    //load số sản phẩm mới
    private static final int AMOUNT_NEW_PRODUCT = 15;
    private static final int AMOUNT_GENDER_PRODUCT = 20;

    @Autowired
    TrademarkService trademarkService;
    @Autowired
    ProductService productService;

    @GetMapping("/")
    public String getHome(Model model){
        List<Product> listNewProduct = productService.getListNewProduct(1,true).stream().limit(AMOUNT_NEW_PRODUCT).collect(Collectors.toList());
        List<Product> listBoyProduct =productService.getListNewProduct(2,true).stream().limit(AMOUNT_GENDER_PRODUCT).collect(Collectors.toList());
        List<Product> listGirlProduct = productService.getListNewProduct(3,true).stream().limit(AMOUNT_GENDER_PRODUCT).collect(Collectors.toList());
        List<Product> listUnisexProduct = productService.getListNewProduct(4,true).stream().limit(AMOUNT_GENDER_PRODUCT).collect(Collectors.toList());
        model.addAttribute("lstNewProduct",listNewProduct);
        model.addAttribute("lstBoyProduct",listBoyProduct);
        model.addAttribute("lstGirlProduct",listGirlProduct);
        model.addAttribute("lstUnisexProduct",listUnisexProduct);
        model.addAttribute("typeMenu",1);
        return "user/home/home";
    }


    //list thương hiệu với status = true;
    @GetMapping("/getMenu")
//    @ResponseBody
    public ResponseEntity<List<Trademark>> getListTrademark(){
       return ResponseEntity.ok(trademarkService.getTrademarkByStatus(true));
    }



}