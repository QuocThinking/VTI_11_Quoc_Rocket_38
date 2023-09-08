package Exercise_1.question1.Optional;

public class ThiSinh {
    private int sobaoDanh;
    private String hoTen;

    private String diaChi;

    private int mucDoUuTien;

    public ThiSinh(int sobaoDanh, String hoTen, String diaChi, int mucDoUuTien) {
        this.sobaoDanh = sobaoDanh;
        this.hoTen = hoTen;
        this.diaChi = diaChi;
        this.mucDoUuTien = mucDoUuTien;
    }

    public int getSobaoDanh() {
        return sobaoDanh;
    }

    public void setSobaoDanh(int sobaoDanh) {
        this.sobaoDanh = sobaoDanh;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public int getMucDoUuTien() {
        return mucDoUuTien;
    }

    public void setMucDoUuTien(int mucDoUuTien) {
        this.mucDoUuTien = mucDoUuTien;
    }
}
