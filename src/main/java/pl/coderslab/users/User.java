package pl.coderslab.users;

import lombok.Data;
import pl.coderslab.role.Role;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import java.util.Set;

@Entity
@Data
public class User {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false, unique = true, length = 60)
    private String username;
    @NotBlank
    private String password;
    private int enabled;
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Role> roles;

}
