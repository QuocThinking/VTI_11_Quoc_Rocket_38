package Exercise_1.question1.Optional;

public class ThiSinhKhoiC extends ThiSinh{
    private float diemVan;
    private float diemSu;
    private float diemDia;

    public ThiSinhKhoiC(int sobaoDanh, String hoTen, String diaChi, int mucDoUuTien, float diemVan, float diemSu, float diemDia) {
        super(sobaoDanh, hoTen, diaChi, mucDoUuTien);
        this.diemVan = diemVan;
        this.diemSu = diemSu;
        this.diemDia = diemDia;
    }

    public float getDiemVan() {
        return diemVan;
    }

    public void setDiemVan(float diemVan) {
        this.diemVan = diemVan;
    }

    public float getDiemSu() {
        return diemSu;
    }

    public void setDiemSu(float diemSu) {
        this.diemSu = diemSu;
    }

    public float getDiemDia() {
        return diemDia;
    }

    public void setDiemDia(float diemDia) {
        this.diemDia = diemDia;
    }
}
