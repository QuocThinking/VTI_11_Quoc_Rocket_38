package Exercise_1.question1.Optional;

public class ThiSinhKhoiB  extends ThiSinh{
    private float diemToan;
    private float diemHoa;
    private float diemSinh;

    public ThiSinhKhoiB(int sobaoDanh, String hoTen, String diaChi, int mucDoUuTien, float diemToan, float diemHoa, float diemSinh) {
        super(sobaoDanh, hoTen, diaChi, mucDoUuTien);
        this.diemToan = diemToan;
        this.diemHoa = diemHoa;
        this.diemSinh = diemSinh;
    }

    public float getDiemToan() {
        return diemToan;
    }

    public void setDiemToan(float diemToan) {
        this.diemToan = diemToan;
    }

    public float getDiemHoa() {
        return diemHoa;
    }

    public void setDiemHoa(float diemHoa) {
        this.diemHoa = diemHoa;
    }

    public float getDiemSinh() {
        return diemSinh;
    }

    public void setDiemSinh(float diemSinh) {
        this.diemSinh = diemSinh;
    }
}
