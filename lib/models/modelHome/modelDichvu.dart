class ServiceCategory {
  final String categoryName; // Tên chuyên khoa
  final List<Service> services; // Danh sách dịch vụ thuộc chuyên khoa

  ServiceCategory({required this.categoryName, required this.services});
}

class Service {
  final String name; // Tên dịch vụ
  final int price; // Giá dịch vụ

  Service({required this.name, required this.price});
}

List<ServiceCategory> serviceCategories = [
  ServiceCategory(
    categoryName: "Da Liễu",
    services: [
      Service(name: "Khám da liễu (ngoài giờ)", price: 300000),
      Service(name: "Khám da liễu (trong giờ - yêu cầu bác sĩ)", price: 150000),
      Service(name: "Khám da liễu (trong giờ)", price: 200000),
      Service(name: "Khám da liễu - ksk", price: 72900),
      Service(name: "Khám da liễu (VIP)", price: 500000),
    ],
  ),
  ServiceCategory(
    categoryName: "Phụ Khoa",
    services: [
      Service(name: "Thủ thuật sản phụ khoa 2", price: 4200000),
      Service(name: "Khám Phụ Khoa (trong giờ - theo giờ)", price: 200000),
      Service(name: "TT da thừa mép môi độ III", price: 20000000),
      Service(name: "Khám nam khoa (ngoài giờ)", price: 200000),
      Service(name: "Cắt polype cổ tử cung 1", price: 2000000),
      Service(name: "Soi CTC", price: 350000),
      Service(
          name: "Phục hồi âm đạo bằng Laser",
          price: 3000000), // Giá chưa xác định
    ],
  ),
  ServiceCategory(
    categoryName: "Răng Hàm Mặt",
    services: [
      Service(name: "Trám răng - xoang II - A", price: 300000),
      Service(name: "Vệ sinh vùng kẽ - điều trị viêm nướu", price: 100000),
      Service(name: "Mài chỉnh khớp - 1 cặp răng", price: 100000),
      Service(name: "Trám răng thẩm mỹ", price: 700000),
      Service(name: "Bơm rửa nội nha", price: 100000),
      Service(name: "Gắn đá", price: 1000000),
      Service(name: "Thuốc tẩy trắng răng pola 22%", price: 200000),
      Service(name: "Tiểu phẫu răng khôn (IV)", price: 3000000),
      Service(name: "Xử lý túi nha chu (II)", price: 500000),
      Service(name: "Răng tháo lắp Nhật 1 đơn vị", price: 300000),
      Service(name: "Cạo vôi răng độ I", price: 300000),
      Service(name: "Bơm rửa lợi trùm", price: 50000),
      Service(name: "Đặt chốt sợi thủy tinh", price: 800000),
      Service(name: "Chỉnh nha khí cụ - I", price: 5000000),
      Service(name: "Phục hình tháo lắp R Excellent", price: 500000),
      Service(name: "Inlay/ Onlay/ Overlay (Zirconia)", price: 3500000),
      Service(name: "Gắn răng sút", price: 200000),
      Service(name: "Mão toàn sứ trên abutment", price: 5000000),
      Service(name: "Thuốc tẩy trắng răng pola 22% ( NV )", price: 120000),
      Service(name: "Trám răng composite (III)", price: 500000),
      Service(name: "Nhổ răng khôn hàm I", price: 600000),
      Service(name: "Phục hình răng sứ cố định 15 đơn vị", price: 60000000),
      Service(name: "Trám bằng vật liệu GIC (Fuji)", price: 200000),
      Service(name: "Cắt nướu không điều chỉnh xương ổ", price: 300000),
      Service(name: "Đính hạt I", price: 300000),
      Service(name: "Mặt dán sứ", price: 7000000),
      Service(name: "Nhổ răng hàm", price: 500000),
      Service(name: "Nhổ răng khôn HT - độ II", price: 800000),
      Service(name: "Lisi veneer", price: 8000000),
      Service(name: "Nhổ răng hàm II", price: 700000),
    ],
  ),
  ServiceCategory(
    categoryName: "Tai Mũi Họng",
    services: [
      Service(
          name: "Nội Soi Tai Mũi Họng - chỉ dùng cho gói khám", price: 200000),
      Service(name: "Nội Soi Họng - Thanh Quản", price: 200000),
      Service(name: "Lấy dị vật 1 bên tai", price: 200000),
      Service(name: "Nạo sinh thiết tai mũi họng", price: 1000000),
      Service(name: "Nội Soi Tai Mũi Họng", price: 500000),
      Service(name: "Rửa tai", price: 80000),
      Service(name: "Khám tai mũi họng (ngoài giờ)", price: 300000),
      Service(name: "Chăm sóc sau mổ xoang (có nội soi)", price: 300000),
      Service(name: "Lấy dị vật mũi xoang", price: 500000),
      Service(name: "Nội Soi Tai - Vòm Họng", price: 400000),
      Service(name: "Hút đàm nhớt", price: 30000),
      Service(name: "Máng duy trì 2", price: 800000),
      Service(name: "Khám khớp cắn", price: 50000),
      Service(name: "Rửa tai", price: 150000),
      Service(name: "Rửa mũi 1 lần", price: 50000),
      Service(name: "Đo thính lực", price: 150000),
      Service(name: "Xông mũi", price: 50000),
      Service(name: "Nội Soi Tai", price: 200000),
      Service(name: "Inlay/ Onlay/ Overlay (Emax)", price: 5000000),
      Service(name: "Khám nội soi tai mũi họng", price: 300000),
    ],
  ),
  ServiceCategory(
    categoryName: "Mắt",
    services: [
      Service(name: "Đo thị lực điện tử - ksk", price: 150000),
      Service(name: "Soi đáy mắt", price: 200000),
      Service(name: "Khám Mắt (trong giờ)", price: 200000),
      Service(name: "Khám mắt + Đo thị lực - ksk", price: 72900),
      Service(name: "Khám Mắt (ngoài giờ)", price: 300000),
      Service(name: "Lấy dị vật kết - giác mạc", price: 200000),
      Service(name: "Đo nhãn áp", price: 100000),
      Service(name: "Chụp hình màu đáy mắt", price: 350000),
    ],
  ),
  ServiceCategory(
    categoryName: "Ngoại",
    services: [
      Service(name: "Dẫn lưu vết thương", price: 200000),
      Service(
          name: "Nội soi dạ dày - tá tràng - thực quản kết hợp sinh thiết HP",
          price: 1000000),
      Service(name: "Khám Ngoại tiêu hóa(ngoài giờ)", price: 200000),
      Service(name: "Nội soi dạ dày tiền mê + Clotest", price: 1850000),
      Service(name: "Nội soi đại trực tràng - tiền mê", price: 1800000),
    ],
  ),
  ServiceCategory(
    categoryName: "Nội",
    services: [
      Service(name: "Khám nội kiểm tra trước sinh (trong giờ)", price: 200000),
      Service(
          name: "Khám nội nhiễm (ngoài giờ - yêu cầu bác sĩ)", price: 200000),
      Service(name: "Khám nội tổng quát - (VIP)", price: 500000),
      Service(name: "Khám chuyên khoa nội", price: 150000),
      Service(name: "Khám nội tổng quát - gói khám", price: 200000),
      Service(
          name: "Gói tầm soát sức khỏe tiền hôn nhân cơ bản", price: 1540000),
      Service(name: "Đo Điện Tim", price: 80000),
      Service(name: "Khám nội tổng quát - cấp cứu", price: 400000),
      Service(name: "Gói Khám Tổng Quát Cơ Bản Dành Cho Nam", price: 1550000),
      Service(name: "Khảo sát sức khỏe sinh sản nam", price: 1270000),
      Service(
          name: "Gói khám sức khỏe toàn thể cho nữ trên 45t", price: 4455000),
      Service(name: "Gói tầm soát ung thư vòm họng", price: 1260000),
      Service(
          name: "Gói Khám Tổng Quát Toàn Diện Dành Cho Nữ ĐT 2022",
          price: 6615000),
      Service(name: "Gói khám sức khỏe cơ bản", price: 1835000),
      Service(
          name: "Khám nội tổng quát (trong giờ - yêu cầu bác sĩ)",
          price: 150000),
      Service(
          name: "Gói chăm sóc sức khỏe tổng quát toàn diện cho nữ",
          price: 4975000),
      Service(name: "Khám nội & ngoại tổng quát - ksk", price: 72900),
      Service(
          name: "Gói Khám Tổng Quát Cơ Bản Dành Cho Nữ Có QH 2022",
          price: 2170000),
      Service(name: "Gói tầm soát bệnh lý gan", price: 1560000),
      Service(
          name: "Khám thẩm định Generali",
          price: 200000), // Chưa có giá, có thể để 0 hoặc null tùy xử lý
    ],
  ),
  ServiceCategory(
    categoryName: "CĐHA",
    services: [
      Service(name: "Siêu Âm Mô Mềm Màu", price: 200000),
      Service(name: "Siêu Âm Noãn màu - IUI", price: 370000),
      Service(name: "X-Quang cổ bàn chân T_N", price: 200000),
      Service(name: "Siêu Âm Tuyến Giáp", price: 250000),
      Service(name: "X-Quang bàn tay T_N", price: 200000),
      Service(name: "X-Quang Cẳng Chân phải T_N", price: 200000),
      Service(name: "Siêu Âm Độ Mờ Da Gáy (Song thai)", price: 450000),
      Service(name: "X-Quang Schuller tai", price: 200000),
      Service(name: "Siêu Âm Tổng Quát màu", price: 200000),
      Service(name: "X-Quang HSG", price: 1000000),
      Service(name: "Siêu âm khớp vai", price: 250000),
      Service(name: "Siêu âm não - xuyên thóp trắng đen", price: 80000),
      Service(name: "X-Quang Cổ Nghiêng", price: 150000),
      Service(name: "Siêu Âm Hình Thái Học 1 - tam thai", price: 700000),
      Service(name: "Siêu âm kiểm tra chỉ số ối", price: 100000),
      Service(name: "Siêu âm KT NMTC TTON", price: 200000),
      Service(name: "Siêu Âm Noãn màu - IVF", price: 370000),
      Service(name: "Siêu âm thai màu - đơn thai", price: 250000),
      Service(name: "X-Quang Khung Chậu T_N", price: 260000),
      Service(name: "Siêu Âm đầu dò màu", price: 250000),
    ],
  ),
  ServiceCategory(
    categoryName: "SẢN KHOA",
    services: [
      Service(name: "Gói khám sức khỏe tiền sản cho nữ", price: 4935000),
      Service(name: "Khám mong con (ngoài giờ)", price: 300000),
      Service(
          name: "Khám và tư vấn sinh sản dành cho nam (VIP)", price: 500000),
      Service(name: "Đăng ký IUI bệnh viện Từ Dũ", price: 1000000),
      Service(name: "Khám Thai (trong giờ)", price: 250000),
      Service(name: "Siêu âm Thai 4D - đơn thai", price: 350000),
      Service(name: "Khám thai 03 tháng giữa", price: 1940000),
      Service(name: "Tổng quát thai", price: 1810000),
      Service(name: "Khám mong con (VIP)", price: 500000),
      Service(
          name: "Thai lưu chấm dứt thai kỳ NK <= 7 tuần (khó)", price: 2000000),
    ],
  ),
  ServiceCategory(
    categoryName: "CẤP CỨU",
    services: [
      Service(name: "Theo dõi hồi sức cấp cứu 1 ngày", price: 500000),
      Service(name: "Theo dõi hồi sức cấp cứu nửa ngày", price: 250000),
      Service(name: "Truyền dịch (Natri) - 2 chai", price: 250000),
      Service(name: "Truyền dịch (Natri)", price: 200000),
      Service(
          name:
              "Cấp cứu tại chỗ và vận chuyển bệnh nhân đến bệnh viện 5km -10km",
          price: 800000),
      Service(
          name: "Cấp cứu tại chỗ để lại nhà không chuyển viện 5km -10km",
          price: 600000),
    ],
  ),
  ServiceCategory(
    categoryName: "XÉT NGHIỆM",
    services: [
      Service(name: "Tiêm cản từ", price: 700000),
      Service(name: "X-Quang gót chân T_N", price: 320000),
      Service(name: "X-Quang gót chân trái T_N", price: 160000),
      Service(name: "X-Quang gót chân phải T_N", price: 160000),
      Service(name: "Filariasis spp (Giun Chỉ)", price: 135000),
      Service(name: "Free PSA (Roche)", price: 250000),
      Service(name: "CA 15-3 (Roche)", price: 250000),
      Service(name: "Anti Phospholipide - IgG", price: 260000),
      Service(name: "Syphilis (TPHA)", price: 370000),
      Service(name: "PCR Chlamydia trachomatis", price: 660000),
    ],
  ),
  ServiceCategory(
    categoryName: "GÂY MÊ",
    services: [
      Service(name: "Truyền Dịch (Lactate) - 1 chai", price: 200000),
    ],
  ),
  ServiceCategory(
    categoryName: "MRI",
    services: [
      Service(name: "MRI Cột Sống Toàn Bộ", price: 2350000),
      Service(name: "MRI Cột Sống Thắt Lưng - Cùng", price: 2350000),
      Service(name: "MRI Tử Cung - Phần Phụ", price: 2350000),
      Service(name: "MRI Vùng Chậu", price: 2350000),
      Service(name: "MRI Chậu - Chuyên Sâu Phụ Khoa", price: 2350000),
      Service(name: "MRI Tiền Liệt Tuyến", price: 2350000),
      Service(name: "MRI Tuyến Giáp", price: 2350000),
      Service(name: "MRI Khớp Vai", price: 2350000),
      Service(name: "MRI Mạch Máu Chi", price: 2350000),
      Service(name: "MRI Tuyến Mang Tai", price: 2350000),
    ],
  ),
  ServiceCategory(
    categoryName: "Nhi Khoa",
    services: [
      Service(name: "Cắt chỉ nhi", price: 30000),
      Service(name: "Khám Nhi (trong giờ)", price: 150000),
      Service(name: "Massage toàn thân cho trẻ", price: 30000),
      Service(name: "Xỏ lổ tai cho bé", price: 70000),
      Service(name: "Siêu Âm Tim (Trẻ Em)", price: 350000),
      Service(name: "Vệ sinh răng trẻ em", price: 200000),
      Service(name: "Tham vấn nhi bệnh lý", price: 400000),
      Service(name: "Đánh bóng vết dính trẻ em", price: 100000),
      Service(name: "Khám Nhi (ngoài giờ)", price: 200000),
      Service(name: "Khám và tư vấn nhi", price: 200000),
    ],
  ),
  ServiceCategory(
    categoryName: "Tim Mạch",
    services: [
      Service(name: "Khám Tim Mạch (trong giờ)", price: 250000),
      Service(name: "Khám Tim Mạch (ngoài giờ)", price: 300000),
      Service(name: "Siêu âm Doppler tim", price: 450000),
      Service(name: "Điện tâm đồ (ECG)", price: 150000),
      Service(name: "Holter điện tâm đồ 24 giờ", price: 1200000),
      Service(name: "Siêu âm mạch máu ngoại biên", price: 500000),
      Service(name: "Nghiệm pháp gắng sức", price: 600000),
      Service(name: "Xét nghiệm mỡ máu", price: 350000),
      Service(name: "Đo huyết áp liên tục 24h", price: 800000),
      Service(name: "Tầm soát bệnh tim bẩm sinh", price: 700000),
    ],
  ),
];
