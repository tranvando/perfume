package com.dotv.perfume.config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@Order(1)
public class WebSecurityAdminConfig extends WebSecurityConfigurerAdapter {


    @Qualifier("adminDetailServiceImpl")
    @Autowired
    private UserDetailsService adminDetailsServiceImpl;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//
//    @Override
//    public void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.userDetailsService(adminDetailsServiceImpl).passwordEncoder(passwordEncoder());
//    }
//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        web.ignoring().antMatchers("/manage/**","/uploads/**","/user/**","/utils/**");
//    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .antMatcher("/admin/**")
                .authorizeRequests()
                //.antMatchers("/manage/**","/uploads/**","/user/**","/utils/**").permitAll()
                .antMatchers("/admin/**").hasAnyAuthority("ADMIN_MB","ADMIN_MP","ADMIN_MN","ADMIN_MI","ADMIN_MO","ADMIN_ME","ADMIN_MC","ADMIN_MR","ADMIN_MU")
                //.anyRequest().authenticated()
                .and()

                // c???u h??nh trang ????ng nh???p
                .formLogin().loginPage("/login_admin.html")//trang ????ng nh???p t??y ch???nh
                .loginProcessingUrl("/admin/perform_login_admin")//url submit username, pass
                .defaultSuccessUrl("/login_admin_success", true)//Trang ????ch sau khi ????ng nh???p th??nh c??ng
                .failureUrl("/login_admin.html?login_error=true")//Trang ????ch sau khi ????ng nh???p th???t b???i
                .permitAll()

                .and()

                //c???u h??nh cho ph???n logout
                .logout()
                .logoutUrl("/admin/logout_admin.html")
                .logoutSuccessUrl("/check_login_admin")
                .invalidateHttpSession(true).deleteCookies("JSESSIONID").permitAll();


        // Khi ng?????i d??ng ???? login, v???i vai tr?? USER, Nh??ng truy c???p v??o trang y??u c???u vai tr?? ADMIN, s??? chuy???n h?????ng t???i trang /403
        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
        http.csrf().disable();
    }

    @Autowired
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(adminDetailsServiceImpl).passwordEncoder(bCryptPasswordEncoder);
    }
}
