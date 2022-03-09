package com.dotv.perfume.service.impl;

import com.dotv.perfume.dto.ProductInCartDTO;
import com.dotv.perfume.entity.Cart;
import com.dotv.perfume.repository.CartRepository;
import com.dotv.perfume.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    CartRepository cartRepository;

    @Override
    public List<ProductInCartDTO> getProductInCart(int idUser) {
        return cartRepository.getProductInCart(idUser);
    }

    @Override
    public int addProToCart(Cart cart) {
        Optional<Cart> cartOld = cartRepository.findById(cart.getId());
        int type=0;//sản phẩm chưa có trong giỏ
        //kt cartOld có rỗng ko, isPresent() trả về false khi rỗng.
        if(cartOld.isPresent()){
            cart.setAmount(cart.getAmount()+cartOld.get().getAmount());
            type=1;//Sản phẩm đã có trong giỏ
        }
        cartRepository.save(cart);
        return type;
    }
}
