package com.fpl.sof2031.configs;

import com.fpl.sof2031.filters.AdminInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

import java.nio.charset.StandardCharsets;
import java.util.Locale;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {
    @Autowired
    AdminInterceptor adminInterceptor;
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
                .addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");
        registry
                .addResourceHandler("/upload/**")
                .addResourceLocations("/upload/");
    }
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(loginInterceptor)
//                .addPathPatterns("/checkout", "/profile","/cart/**");

//        registry.addInterceptor(adminInterceptor)
//                .addPathPatterns("/admin/**");

        LocaleChangeInterceptor locale = new LocaleChangeInterceptor();
        locale.setParamName("language");

//        registry.addInterceptor(locale)
//                .addPathPatterns("/**")
//                .excludePathPatterns("/admin/**");
        registry.addInterceptor(locale)
//                .addPathPatterns("/**")
                .excludePathPatterns("/cart/**", "/checkout");
    }

    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();

        messageSource.setBasenames(
                "classpath:i18n/label",
                "classpath:i18n/message_error"
        );
        messageSource.setDefaultEncoding(StandardCharsets.UTF_8.name());
        return messageSource;
    }

    @Bean
    public LocaleResolver localeResolver() {
        CookieLocaleResolver resolver = new CookieLocaleResolver();
        resolver.setDefaultLocale(new Locale("vi"));
        resolver.setCookieMaxAge(60 * 60 * 24 * 7);
        return resolver;
    }



}
