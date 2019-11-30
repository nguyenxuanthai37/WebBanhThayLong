package vn.edu.hcmuaf.nlu.Model;

public class Users {
    int id;
    String fullName, email, passWord, address;
    String phone;
    int level;

    public Users(int id, String fullName, String email, String passWord, String address, String phone, int level) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.passWord = passWord;
        this.address = address;
        this.phone = phone;
        this.level = level;
    }

    public Users() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return "Users{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", passWord='" + passWord + '\'' +
                ", address='" + address + '\'' +
                ", phone=" + phone +
                ", level=" + level +
                '}';
    }
}
