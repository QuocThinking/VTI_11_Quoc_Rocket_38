package Exercise_1.question1.Optional;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class TuyenSinh implements  ITuyenSinh{

    private List<ThiSinh> thiSinhs;

    public TuyenSinh() {
        thiSinhs = new ArrayList<>();
    }




    @Override
    public void themMoiThiSInh() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập khối thi (A/B/C): ");
        String khoiThi = scanner.next();

        ThiSinh thiSinh1;
        if (khoiThi.equalsIgnoreCase("A")) {
            System.out.print("Nhập điểm Toán: ");
            float diemToan = scanner.nextFloat();
            System.out.print("Nhập điểm Lý: ");
            float diemLy = scanner.nextFloat();
            System.out.print("Nhập điểm Hoá: ");
            float diemHoa = scanner.nextFloat();

            System.out.print("Nhập số báo danh: ");
            int sobaoDanh = scanner.nextInt();
            scanner.nextLine();
            System.out.print("Nhập họ tên: ");
            String hoTen = scanner.nextLine();
            System.out.print("Nhập địa chỉ: ");
            String diaChi = scanner.nextLine();
            System.out.print("Nhập mức ưu tiên: ");
            int mucDoUuTien = scanner.nextInt();

            thiSinh1 = new ThiSinhKhoiA(sobaoDanh, hoTen, diaChi, mucDoUuTien, diemToan, diemLy, diemHoa);
        } else if (khoiThi.equalsIgnoreCase("B")) {
            System.out.print("Nhập điểm Toán: ");
            float diemToan = scanner.nextFloat();
            System.out.print("Nhập điểm Hóa: ");
            float diemhoa = scanner.nextFloat();
            System.out.print("Nhập điểm Sinh: ");
            float diemsinh = scanner.nextFloat();

            System.out.print("Nhập số báo danh: ");
            int sobaoDanh = scanner.nextInt();
            scanner.nextLine();
            System.out.print("Nhập họ tên: ");
            String hoTen = scanner.nextLine();
            System.out.print("Nhập địa chỉ: ");
            String diaChi = scanner.nextLine();
            System.out.print("Nhập mức ưu tiên: ");
            int mucDoUuTien = scanner.nextInt();
            thiSinh1 = new ThiSinhKhoiB(sobaoDanh, hoTen, diaChi, mucDoUuTien,diemToan,diemhoa,diemsinh);
        } else if (khoiThi.equalsIgnoreCase("C")) {
            System.out.print("Nhập điểm Văn: ");
            float diemVan = scanner.nextFloat();
            System.out.print("Nhập điểm Sử: ");
            float diemSu = scanner.nextFloat();
            System.out.print("Nhập điểm Địa: ");
            float diemDia = scanner.nextFloat();

            System.out.print("Nhập số báo danh: ");
            int sobaoDanh = scanner.nextInt();
            scanner.nextLine();
            System.out.print("Nhập họ tên: ");
            String hoTen = scanner.nextLine();
            System.out.print("Nhập địa chỉ: ");
            String diaChi = scanner.nextLine();
            System.out.print("Nhập mức ưu tiên: ");
            int mucDoUuTien = scanner.nextInt();
            thiSinh1 = new ThiSinhKhoiB(sobaoDanh, hoTen, diaChi, mucDoUuTien,diemVan,diemSu,diemDia);
        } else {
            System.out.println("Khối thi không hợp lệ.");
            return;
        }

        thiSinhs.add(thiSinh1);
        System.out.println("Thêm thí sinh thành công.");
    }

    @Override
    public void hienThiThongTin() {
        for(ThiSinh thiSinh : thiSinhs){
            System.out.println("Thông tin cùa thì sinh có số báo danh : " + thiSinh.getSobaoDanh() + " là: ");
            System.out.println("Số báo danh : " + thiSinh.getSobaoDanh());
            System.out.println("Họ Tên : " + thiSinh.getHoTen());
            System.out.println("Địa chỉ : " + thiSinh.getDiaChi());
            System.out.println("Mức ưu tiên : " + thiSinh.getMucDoUuTien());
            if(thiSinh instanceof ThiSinhKhoiA){
                ThiSinhKhoiA thiSinhKhoiA = (ThiSinhKhoiA) thiSinh;
                System.out.println("Khối thi: A");
                System.out.println("Điểm Toán: " + thiSinhKhoiA.getDiemToan());
                System.out.println("Điểm Lý: " + thiSinhKhoiA.getDiemLy());
                System.out.println("Điểm Hoá: " + thiSinhKhoiA.getDiemHoa());

            }else if (thiSinh instanceof ThiSinhKhoiB) {
                ThiSinhKhoiB thiSinhKhoiB = (ThiSinhKhoiB) thiSinh;
                System.out.println("Khối thi: B");
                System.out.println("Điểm Toán: " + thiSinhKhoiB.getDiemToan());
                System.out.println("Điểm Hoá: " + thiSinhKhoiB.getDiemHoa());
                System.out.println("Điểm Sinh: " + thiSinhKhoiB.getDiemSinh());
            } else if (thiSinh instanceof ThiSinhKhoiC) {
                ThiSinhKhoiC thiSinhKhoiC = (ThiSinhKhoiC) thiSinh;
                System.out.println("Khối thi: C");
                System.out.println("Điểm Văn: " + thiSinhKhoiC.getDiemVan());
                System.out.println("Điểm Sử: " + thiSinhKhoiC.getDiemSu());
                System.out.println("Điểm Địa: " + thiSinhKhoiC.getDiemDia());
            }
            System.out.println("---------------------------------------");
        }
    }

    @Override
    public void timKiemTheoSoBaoDanh(int sobaodanh) {
            for (ThiSinh thiSinh : thiSinhs){
                if(thiSinh.getSobaoDanh() == sobaodanh){
                    System.out.println("Số báo danh : " + thiSinh.getSobaoDanh());
                    System.out.println("Họ Tên : " + thiSinh.getHoTen());
                    System.out.println("Địa chỉ : " + thiSinh.getDiaChi());
                    System.out.println("Mức ưu tiên : " + thiSinh.getMucDoUuTien());
                    if(thiSinh instanceof ThiSinhKhoiA){
                        ThiSinhKhoiA thiSinhKhoiA = (ThiSinhKhoiA) thiSinh;
                        System.out.println("Khối thi: A");
                        System.out.println("Điểm Toán: " + thiSinhKhoiA.getDiemToan());
                        System.out.println("Điểm Lý: " + thiSinhKhoiA.getDiemLy());
                        System.out.println("Điểm Hoá: " + thiSinhKhoiA.getDiemHoa());

                    }else if (thiSinh instanceof ThiSinhKhoiB) {
                        ThiSinhKhoiB thiSinhKhoiB = (ThiSinhKhoiB) thiSinh;
                        System.out.println("Khối thi: B");
                        System.out.println("Điểm Toán: " + thiSinhKhoiB.getDiemToan());
                        System.out.println("Điểm Hoá: " + thiSinhKhoiB.getDiemHoa());
                        System.out.println("Điểm Sinh: " + thiSinhKhoiB.getDiemSinh());
                    } else if (thiSinh instanceof ThiSinhKhoiC) {
                        ThiSinhKhoiC thiSinhKhoiC = (ThiSinhKhoiC) thiSinh;
                        System.out.println("Khối thi: C");
                        System.out.println("Điểm Văn: " + thiSinhKhoiC.getDiemVan());
                        System.out.println("Điểm Sử: " + thiSinhKhoiC.getDiemSu());
                        System.out.println("Điểm Địa: " + thiSinhKhoiC.getDiemDia());
                    }
                }
            }
    }
}
