package Exercise_1.question1.Optional;

public class ThiSinhKhoiA  extends ThiSinh{
    private float diemToan;
    private float diemLy;
    private float diemHoa;

    public ThiSinhKhoiA(int sobaoDanh, String hoTen, String diaChi, int mucDoUuTien, float diemToan, float diemLy, float diemHoa) {
        super(sobaoDanh, hoTen, diaChi, mucDoUuTien);
        this.diemToan = diemToan;
        this.diemLy = diemLy;
        this.diemHoa = diemHoa;
    }


    public float getDiemToan() {
        return diemToan;
    }

    public void setDiemToan(float diemToan) {
        this.diemToan = diemToan;
    }

    public float getDiemLy() {
        return diemLy;
    }

    public void setDiemLy(float diemLy) {
        this.diemLy = diemLy;
    }

    public float getDiemHoa() {
        return diemHoa;
    }

    public void setDiemHoa(float diemHoa) {
        this.diemHoa = diemHoa;
    }
}
