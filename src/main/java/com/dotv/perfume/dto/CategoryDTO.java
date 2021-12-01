package com.dotv.perfume.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class CategoryDTO {
    private Integer id;
    @NotBlank(message = "Không được để trống")
    private String name;
    @NotBlank(message = "Không được để trống")
    private String status;
}
