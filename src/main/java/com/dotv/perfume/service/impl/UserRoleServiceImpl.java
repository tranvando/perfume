package com.dotv.perfume.service.impl;

import com.dotv.perfume.dto.UserDTO;
import com.dotv.perfume.entity.Role;
import com.dotv.perfume.entity.User;
import com.dotv.perfume.entity.UserRole;
import com.dotv.perfume.entity.UserRoleId;
import com.dotv.perfume.repository.RoleRepository;
import com.dotv.perfume.repository.UserRoleRepository;
import com.dotv.perfume.service.UserRoleService;
import com.dotv.perfume.service.UserService;
import com.dotv.perfume.utils.PerfumeUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;

@Service
public class UserRoleServiceImpl implements UserRoleService {
    @Autowired
    UserRoleRepository userRoleRepository;

    @Autowired
    UserService userService;

    @Autowired
    PerfumeUtils perfumeUtils;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;


    @Override
    @Transactional
    public UserRole saveUser(User user) {
        Timestamp timeNow = perfumeUtils.getDateNow();
        user.setCreatedDate(timeNow);
        user.setCreatedBy(user.getFullName());
        user.setStatus(true);
        user.setPassword(bCryptPasswordEncoder.encode((user.getPassword())));
        user.setType("GUEST");
        //lưu user vào db
        userService.saveOrUpdate(user);
        //Tìm role là khách hàng
        Role role = roleRepository.findByCode("G");
        //Tạo id user_role
        UserRoleId userRoleId = new UserRoleId(user.getId(),role.getId());
        //Tạo user_role
        UserRole userRole = new UserRole(userRoleId,"GUEST",timeNow,true,user,role);
        //save userRole
        return userRoleRepository.save(userRole);
    }

    @Override
    @Transactional
    public void saveEmployee(UserDTO userDTO) throws Exception {
        Timestamp timeNow = perfumeUtils.getDateNow();
        User user = modelMapper.map(userDTO,User.class);
        user.setCreatedDate(timeNow);
        user.setPassword(bCryptPasswordEncoder.encode(("Admin@123")));
        if(userDTO.getId()!=null){
            //nếu cập nhật thì xóa các quyền
            userRoleRepository.deleteRoleByIdUser(userDTO.getId());
            //set pass cũ
            user.setPassword(userService.getUserById(userDTO.getId()).getPassword());
        }
        String permiss="Quản lý ";
        for(int i=0; i<userDTO.getPermiss().length; i++){
            if(i!=0){
                permiss+=", ";
            }
            switch(userDTO.getPermiss()[i]) {
                case "MB":
                    permiss+="thương hiệu";
                    break;
                case "MP":
                    permiss+="sản phẩm";
                    break;
                case "MN":
                    permiss+="tin tức";
                    break;
                case "MI":
                    permiss+="giới thiệu";
                    break;
                case "MO":
                    permiss+="đơn hàng";
                    break;
                case "MU":
                    permiss+="khách hàng";
                    break;
                case "MC":
                    permiss+="liên hệ";
                    break;
            }
        }
        user.setPermission(permiss);
        user.setType("ADMIN_S");
        //lưu user vào db
        userService.saveOrUpdate(user);
        //for tìm các role
        for(int i=0; i<userDTO.getPermiss().length; i++){
            Role role = roleRepository.findByCode(userDTO.getPermiss()[i]);
            //Tạo id user_role
            UserRoleId userRoleId = new UserRoleId(user.getId(),role.getId());
            //add quyền theo code
            String per="";
            switch(userDTO.getPermiss()[i]) {
                case "MB":
                    per="ADMIN_MB";
                    break;
                case "MP":
                    per="ADMIN_MP";
                    break;
                case "MN":
                    per="ADMIN_MN";
                    break;
                case "MI":
                    per="ADMIN_MI";
                    break;
                case "MO":
                    per="ADMIN_MO";
                    break;
                case "MU":
                    per="ADMIN_MU";
                    break;
                case "MC":
                    per="ADMIN_MC";
                    break;
            }
            //Tạo user_role
            UserRole userRole = new UserRole(userRoleId,per,timeNow,true,user,role);
            //save userRole
            userRoleRepository.save(userRole);
        }
    }
}
