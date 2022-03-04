package com.dotv.perfume.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;
@Embeddable
public class UserRoleId implements Serializable {

    @Column(name = "id_user")
    private Integer idUser;
    @Column(name = "id_role")
    private Integer idRole;


    public UserRoleId() {
    }

    public UserRoleId(Integer idUser, Integer idRole) {
        this.idUser = idUser;
        this.idRole = idRole;
    }

    public Integer getIdUser() {
        return idUser;
    }

    public void setIdUser(Integer idUser) {
        this.idUser = idUser;
    }

    public Integer getIdRole() {
        return idRole;
    }

    public void setIdRole(Integer idRole) {
        this.idRole = idRole;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserRoleId)) return false;
        UserRoleId that = (UserRoleId) o;
        return getIdUser().equals(that.getIdUser()) && getIdRole().equals(that.getIdRole());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getIdUser(), getIdRole());
    }
}
