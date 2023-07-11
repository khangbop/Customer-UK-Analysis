# Project2
An analytic report of a fashion company.

Công ty A bán thời trang, và họ có cửa hàng tại những thủ đô của các nước Anh (London), Pháp (Paris) ,Ý (Milan) , Đức (Berlin).
Khách hàng có thể mua hàng trực tiếp ở cửa hàng hoặc mua trực tuyến. 
Công ty cũng đồng thời duy trì trang web bán hàng online với thông tin và hình ảnh về sản phẩm. 
Có nhiều trường hợp, lượng truy cập tăng lên khi có nhiều sản phẩm mới được đưa lên. 

Ban quản trị muốn bạn làm 1 báo cáo phân tích dữ liệu để trả lời các câu hỏi : 
 - Website traffic có ảnh hưởng đến doanh thu không ? 
 - Sản phẩm nào mang lại pageviews và doanh thu cao nhất?
 - Có những nhóm khách hàng nào ? 

Nên nhớ rằng ban lãnh đạo không phải ai cũng rành về data, nên hãy trình bày nội dung hợp lý để ai cũng có thể hiểu. 
Có điểm cộng nếu hv phân tích được nhiều yếu tố khác liên quan đến câu hỏi. 

FILE:
Customer(UK):
- CustomerInfo:
	+ ID : customer id
	+ FirstName
	+ LastName
	+ Country
	+ DateJoined : Ngày khách hàng tham gia
	+ Gender
	+ Birthday
	+ Newsletter
- CustomerTransaction
	+ OrderID:
	+ CustomerID
	+ ItemID
	+ TransactionDate: ngày giao dịch
	+ Channel: phương thức giao dịch (online hay offline)
- Items:
	+ ItemID
	+ Product: tên mặt hàng
	+ Brand: hãng
	+ SellPrice: Giá sp
	+ CostPrice: Chi phí sp
Traffic:
	+ Page URL: tên miền của trang web
	+ users: số người dùng
	+ uniquePageviews: số lượng truy cập độc nhất
	+ pageviews: số lượng truy cập
	+ Brand: hãng
	+ Posted On: ngày đăng

WEB TRAFFIC CÓ ẢNH HƯỞNG ĐẾN DOANH THU KHÔNG?
* Để trả lời câu hỏi này ta cần biết doanh thu:
   - Đầu tiên tính giá sp (Giá - Chi phí sp). Ta sẽ gọi này là Profit (lợi nhuận)
   - Dựa vào giá thực tính doanh thu trên bảng Orders (Revenue)
   - Ta có tổng doanh thu năm 2020: 13641525 với 25213 đơn hàng và theo từng tháng
	+ T1 có doanh thu  1107640 vs 2060 đơn, số ng dùng 2436793.4 số lượng truy cập 2695247.2
	+ T2 có doanh thu  1138207 vs 2059 đơn, số ng dùng 2284914.4 số lượng truy cập 2658068.8
	+ T3 có doanh thu  1123708 vs 2097 đơn, số ng dùng 2642547.8 số lượng truy cập 3014018.6
	+ T4 có doanh thu  1146305 vs 2102 đơn, số ng dùng 2431741.4 số lượng truy cập 2729405.4
	+ T5 có doanh thu  1153128 vs 2171 đơn, số ng dùng 2109601.4 số lượng truy cập 2345018.6
	+ T6 có doanh thu  1162206 vs 2119 đơn, số ng dùng 2162548.6 số lượng truy cập 2395284.4
	+ T7 có doanh thu  1133991 vs 2095 đơn, số ng dùng 2326114.0 số lượng truy cập 2705541.8
	+ T8 có doanh thu  1138099 vs 2104 đơn, số ng dùng 2199366.2 số lượng truy cập 2432533.8
	+ T9 có doanh thu  1160915 vs 2169 đơn, số ng dùng 2047493.4 số lượng truy cập 2325618.4
	+ T10 có doanh thu 1116916 vs 2089 đơn, số ng dùng 1946837.4 số lượng truy cập 2263516.4
	+ T11 có doanh thu 1153503 vs 2093 đơn, số ng dùng 1782651.0 số lượng truy cập 2160243.0
	+ T12 có doanh thu 1106907 vs 2055 đơn, số ng dùng 593419.8 số lượng truy cập 771543.8
==> Ta thấy doanh thu từ t1-t2 tăng t2-t3 giảm t3-t4-t5-t6 tăng t6-t7 giảm
t7-t8-t9 tăng t9-t10 giảm t10-t11 tăng t11-t12 giảm
==> Nhìn qua biểu đồ ta thấy được web traffic hầu như không ảnh hưởng đến doanh thu

NHỮNG SẢN PHẨM NÀO MANG LẠI PAGEVIEWS VÀ DOANH THU CAO NHẤT?
Sau đây là top 10 sản phẩm mang lại lượt truy cập nhiều nhất

sonEies-x0.139039192479287	232177
porQlease0.507911745358356	170599
pumMvideo0.837931992780922	128891.8
besfeek-50.280274313298435	126771
rogLrecap0.644396392507623	124284.2
jefXaunch0.410067394635876	104984.2
chrL-york0.372865344640649	103863.4
wradaunch0.370927222684073	103850
angztered0.926486710136623	87999.6
goa]akers0.899516668943853	78523.6

Top 10 sp mang lại doanh thu cao nhất

3444	9	3592
13954	7	3402
193	2	3285
14995	2	3261
7437	8	3249
2445	3	3246
8025	5	3063
7046	3	3024
4057	10	2964
4093	11	2940

Những sp lỗ nặng: ...
Hãng doanh thu: ...
Hãng lỗ nặng: ...
