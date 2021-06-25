import java.io.Serializable;

public class Customer implements Serializable {

   public String name, bithDay, address, images;

    public Customer() {
    }

    public Customer(String name, String bithDay, String address, String images) {
        this.name = name;
        this.bithDay = bithDay;
        this.address = address;
        this.images = images;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBithDay() {
        return bithDay;
    }

    public void setBithDay(String bithDay) {
        this.bithDay = bithDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
}
