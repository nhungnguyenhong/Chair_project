# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
User.create!([
	{id: 1, role: 1,
		name: "Do Thi Hai",
		email: "dothihai@gmail.com",
		password: "123456", password_confirmation: "123456",
		nickname: "dothihai",
		gender: "female",
		remote_img_url: "http://file.vforum.vn/hinh/2018/02/hinh-cho-cuoi-deu-cho-de-thuong-12.jpg",
		birthday:"1997-10-10"},

	{id: 2, role: 0,
		name: "Trinh Huu Vu",
		email: "trinhhuuvu@gmail.com",
		password: "123456", password_confirmation: "123456",
		nickname: "trinhhuuvu",
		gender: "male",
		remote_img_url: "http://file.vforum.vn/hinh/2018/02/hinh-cho-cuoi-deu-cho-de-thuong-12.jpg",
		birthday: "1997-12-12"},

	{id: 3, role: 0,
		name: "Nguyen Thi Kieu Thuong",
		email: "nguyenthikieuthuong@gmail.com",
		password: "123456", password_confirmation: "123456",
		nickname: "kieuthuong",
		gender: "female",
		remote_img_url: "https://yolo.vn/wp-content/uploads/2019/08/hinh-anh-cho-pomsky-dep-45.jpg",
		birthday: "1997-03-03"},

	{id: 4, role: 0,
		name: "Nguyen Ngoc Trung",
		email: "nguyenngoctrung@gmail.com",
		password: "123456", password_confirmation: "123456",
		nickname: "nguyenngoctrung",
		gender: "male",
		remote_img_url: "http://cdn.hoahoctro.vn/uploads/2018/10/5bc41f947aa93-1.jpg",
		birthday: "1997-06-06"},

	{id: 5, role: 0,
		name: "Duong Ngoc Son",
		email: "duongngocson@gmail.com",
		password: "123456", password_confirmation: "123456",
		nickname: "duongngocson",
		gender: "male",
		remote_img_url: "https://petto.vn/wp-content/uploads/2019/03/InstaSave3.jpg",
		birthday: "1997-11-11"},
])

Category.delete_all
Category.create! id: 1, name: "Smart Office Chair", description: "For office worker", img: "https://i.ibb.co/59FsdJ6/1-7da64fb3-7803-4f99-a7a8-7bbbe4c2f3b0-2048x2048-removebg-preview.png"
Category.create! id: 2, name: "Wheelchair", description: "For handicapped people", img: "https://i.ibb.co/Bgp5w8m/Bronze-6016-Electrical-Wheelchair-Lightweight-Remote-Control-1-removebg-preview.png"

Brand.delete_all
Brand.create!([
	{
		name: "Medline", 
		description: "We make healthcare run better.", 
		img: "https://www.medline.com/wp-content/uploads/2019/05/medline-logo-180-180.jpg",
		category_id: 2
	},
	{
		name: "NOVA", 
		description: "Committed to your safety & comfort", 
		img: "https://www.novajoy.com/wp-content/uploads/2014/04/newlogo.png",
		category_id: 2
	},
	{
		name: "Karman", 
		description: "Nation's leading manufacturer of wheelchairs", 
		img: "https://www.karmanhealthcare.com/wp-content/uploads/2019/01/karmanLogo-1.jpg",
		category_id: 2
	},
	{
		name: "ComfyGO", 
		description: "We make lifes easier", 
		img: "https://www.comfygomobility.com/wp-content/uploads/2017/11/comfygo-logo2.png",
		category_id: 2
	},
	{
		name: "EW Elite", 
		description: "We provide you with the best electric-powered wheelchairs that will allow you to improve your mobility and do more.", 
		img: "https://cdn.shopify.com/s/files/1/0053/1306/9129/files/logo-EW-web_200x.png?v=1550610488",
		category_id: 2
	},
	{
		name: "Herman Miller", 
		description: "Settings for every purpose", 
		img: "https://c.imge.to/2019/12/11/vzVvnH.png",
		category_id: 1
	},
	{
		name: "Ergohuman", 
		description: "Extraordinary comfort, ease of use and unique styling", 
		img: "https://ergohuman.com/product_images/logo_1393628483__72912.jpg",
		category_id: 1
	},
	{
		name: "Smugdesk", 
		description: "Create the best products which aid in promoting your health, with the latest technology and advances in office furniture", 
		img: "https://cdn.shopify.com/s/files/1/0055/2714/2490/files/IMG_3178_225x.PNG?v=1562220483",
		category_id: 1
	},
	{
		name: "Humanscale",
		description: "Leading manufacturer of ergonomic office tools", 
		img: "https://www.humanscale.com/imagesHS2017/logo.svg",
		category_id: 1
	},
	{
		name: "Knoll",
		description: "Knoll is a constellation of design-driven brands and people, working together with our clients to create inspired modern interiors.", 
		img: "https://www.knoll.com/images/logo.png",
		category_id: 1
	}
])

Chair.delete_all
Chair.create!([
	### Medline
	{
		name:"Medline Premium Ultra-Lightweight Wheelchair with Flip-Back Desk ",
		category_id: 2,
		brand_id: 1,
		function: "Wheelchair",
		remote_img_url:"https://i.imgur.com/4NCnEC4.png",
		description:"Flip-back, desk-length arms make it easy to navigate under tables | elevating leg rests enhance comfort and remove easily
Breathable nylon upholstery is soft and comfortable
Premium welds ensure reliability and durability",
		price: 2000,
		quantity: 20
	},
	{
		name:"Medline Lightweight Transport Wheelchair with Handbrakes",
		category_id: 2,
		brand_id: 1,
		function: "Wheelchair",
		remote_img_url:"https://i.imgur.com/wlIs9Nf.png",
		description:"Medline transport lightweight wheelchair has large 12 inch rear wheels for better performance on uneven outdoor surfaces | Loop-style manual handbrakes are ideal for locking the rear wheels during transfers
Transport chair with powder coated aluminum ultralight frame is durable and has a weight capacity of 300 lbs",
		price: 1740,
		quantity: 20
	},
	{
		name:"Medline Transport Wheelchair with Lightweight Steel Frame",
		category_id: 2,
		brand_id: 1,
		function: "Wheelchair",
		remote_img_url:"https://images-na.ssl-images-amazon.com/images/I/81eQI5aNIBL._AC_SX522_.jpg",
		description:"Medline lightweight transport chair features swing-away footrests and locking brakes to make transfers easy, large 12 inch wheels, and special armrests that allow you to sit close to most desks or tables
Antimicrobial Product Protection - Nylon upholstery features Microban antimicrobial technology for built-in protection that inhibits the growth of stains and odors from bacteria, mold & mildew",
		price: 1520,
		quantity: 20
	},
	{
		name:"Medline Extra-Wide Wheelchairs",
		category_id: 2,
		brand_id: 1,
		function: "Wheelchair",
		remote_img_url:"https://www.medline.com/media/catalog/sku/mds/MDS806700_PRI04.JPG",
		description:"Wheelchairs feature threaded seat screw inserts to minimize stripping from upholstery changes
		Armrests and calf pads (if included) are upholstered and padded
		Carbon steel frame has rust- and chip-resistant chrome plating while navy vinyl upholstery is easy to clean",
		price: 1490,
		quantity: 20
	},

	### NOVA
	{
		name:"19 inch Transport Chair with 12″ Rear Wheels",
		category_id: 2,
		brand_id: 2,
		function: "Wheelchair",
		remote_img_url:"https://www.novajoy.com/wp-content/uploads/2017/08/WEB_352B-MAIN-2.jpg",
		description:"The Lightweight Transport Chair 19 in. (model 352) has a lightweight aluminum frame and padded upholstery. It has a quick release fold-down back, as well as padded, detachable/reversible desk arms for added convenience.",
		price: 1490,
		quantity: 20
	},
	{
		name:"19″ Steel Transport Chair in Champagne",
		category_id: 2,
		brand_id: 2,
		function: "Wheelchair",
		remote_img_url:"https://novajoy.com/wp-content/uploads/2014/10/19sttransch.jpg",
		description:"The Steel Transport Chair 19 inch 319C (Champagne) has a carbon steel frame and padded upholstery. It is foldable and has a quick release fold-down back, as well as padded, fixed full-length arms for added comfort",
		price: 1490,
		quantity: 20
	},

	### Karman
	{
		name:"Karman Healthcare S-Ergo 115 Limited Edition, Alpine White",
		category_id: 2,
		brand_id: 3,
		function: "Wheelchair",
		remote_img_url:"https://i.imgur.com/jkRyQcf.png",
		description:"Weighs only 25 pounds (without footrest) and the maximum weight capacity is 250 pounds
Limited Edition Alpine White Frame
Breathable Mesh Upholstery and Back Pouch Standard
Removable Anti Bacterial Seat And Back Cushions",
		price: 629,
		quantity: 20
	},
	{
		name:"KM-5000 Transport – 33 lbs",
		category_id: 2,
		brand_id: 3,
		function: "Wheelchair",
		remote_img_url:"https://www.karmanhealthcare.com/wp-content/uploads/2013/01/KM5000TP1XL-510x651.jpg",
		description:"The Karman Healthcare KM-5000TP Transport Wheelchair is an ultra lightweight folding aluminum reclining wheelchair. With full length padded armrests, an adjustable height head pillow, and more this wheelchair has added comfort for any user.",
		price: 999,
		quantity: 20
	},
	{
		name:"LT-2000 – 19 lbs",
		category_id: 2,
		brand_id: 3,
		function: "Wheelchair",
		remote_img_url:"https://www.karmanhealthcare.com/wp-content/uploads/2013/01/LT-2019BD2LG.jpeg",
		description:"The Karman Lightweight Transporter Aluminum Wheelchair weighs only 19 lbs. and folds easily for travel and storage. This lightweight transporter is both sturdy and user friendly with swing away footrests and fully padded, fixed armrests.",
		price: 139,
		quantity: 20
	},
	{
		name:"MVP-502 Transport – 34 lbs",
		category_id: 2,
		brand_id: 3,
		function: "Wheelchair",
		remote_img_url:"https://www.karmanhealthcare.com/wp-content/uploads/2013/01/mvp502-768x864.jpg",
		description:"MVP-502-TP: Premium Ergonomic Folding Recliner Wheelchair. Since most recliner chair users do not propel themselves, it only makes sense to offer a chair with “Transport” style wheels.",
		price: 1699,
		quantity: 20
	},


	### ComfyGO
	{
		name:"601-7001 Silver Air Travel Electric Mobility Power Wheelchair Lithium Battery",
		category_id: 2,
		brand_id: 4,
		function: "Wheelchair",
		remote_img_url:"https://i0.wp.com/www.comfygomobility.com/wp-content/uploads/2019/03/Silver-601-7001-Electrical-Wheelchair-Lightweight-Remote-Control-1.jpg?resize=510%2C510&ssl=1",
		description:"The COMFY GO wheelchair is an innovative all new design travel folding wheelchair. The listing is for wheelchair with Lithium Battery. The Transport wheelchair is lightweight, airlines friendly, and easy to load is a car trunk",
		price: 1899,
		quantity: 20
	},
	{
		name:"6016 Black Remote Control 19″ Wide Wheelchair",
		category_id: 2,
		brand_id: 4,
		function: "Wheelchair",
		remote_img_url:"https://i2.wp.com/www.comfygomobility.com/wp-content/uploads/2019/06/Black-6016-Electrical-Wheelchair-Lightweight-Remote-Control-1.jpg?resize=510%2C510&ssl=1",
		description:"New Model 6016 Power Wheelchair. Remote Control and Lightweight. Now with Wider Seat !!!",
		price: 1999,
		quantity: 20
	},
	{
		name:"6009 Led Acid Black Comfy Go Electric Wheelchair",
		category_id: 2,
		brand_id: 4,
		function: "Wheelchair",
		remote_img_url:"https://i1.wp.com/www.comfygomobility.com/wp-content/uploads/2019/03/Black-3.jpg?fit=1024%2C1024&ssl=1",
		description:"YOUR SAFEST CHOICE for a superior Electric Wheelchair. We’ve built a host of important safety features into this very high quality wheelchair. Including joy stick, more stable rear wheels, super stable foot rest, and very durable construction",
		price: 1099,
		quantity: 20
	},
	{
		name:"6016 Bronze Remote Control 19″ Wide Wheelchair",
		category_id: 2,
		brand_id: 4,
		function: "Wheelchair",
		remote_img_url:"https://i0.wp.com/www.comfygomobility.com/wp-content/uploads/2019/12/Bronze-6016-Electrical-Wheelchair-Lightweight-Remote-Control-1.jpg?resize=510%2C510&ssl=1",
		description:"New Model 6016 Power Wheelchair. Remote Control and Lightweight. Now with Wider Seat !!!",
		price: 1999,
		quantity: 20
	},

	### EW Elite

	{
		name:"ComfyGO Best Rated Exclusive Deluxe Electric Wheelchair",
		category_id: 2,
		brand_id: 5,
		function: "Wheelchair",
		remote_img_url:"https://images-na.ssl-images-amazon.com/images/I/61HYwdnw8wL._AC_SL1500_.jpg",
		description:"✔ As a US Company We are Giving Gold Standard 24x7 Customer Support for All of Our Customers. Now with an Unbeatable Price. Warranty: 3 year for Frame, 1 Year for Motor and Joystick Controller, 6 Months for Battery
✔ TRAVEL EASILY - Convenient for storage and transport for folding feature and light-weight design for easy carrying. Now with the Bluetooth Remote Controller You can Control Your Wheelchair from a Distance. Joystick can be placed either left or right ride of the armrest",
		price: 400,
		quantity: 20

	},
	{
		name:"2019 UPGRADED Folding Electric Powered Wheelchair",
		category_id: 2,
		brand_id: 5,
		function: "Wheelchair",
		remote_img_url:"https://i.imgur.com/Uzx54XY.png",
		description:"THE SAFEST AND MOST RELIABLE electric wheelchair available in the market today. The INNUOVO Power Wheelchair is FDA approved and can be used for air travel.
	LIGHTWEIGHT AND PORTABLE device that folds to easily fit in the trunk of your car. The entire device, including batteries, weighs 50 lb.
	EASY TO OPERATE with a simple joystick design. It can be operated with one hand.",
		price: 500,
		quantity: 20
	},

	### Herman Miller

	{
		name:"HM Sayl Chairs",
		category_id: 1,
		brand_id: 6,
		function: "Office Chairs",
		remote_img_url:"https://www.hermanmiller.com/content/dam/hmi/hmidam/active/2015/11/01/LI_SAY_P_20151101_014.tif.rendition.992.992.jpg",
		description:"Good design, healthy support and exceptional value are always attractive – and Sayl delivers all three. By using smart engineering to transform simple materials, we were able to make Sayl attainable for more people.",
		price: 1490,
		quantity: 20
	},
	{
		name:"HM Aeron Chairs",
		category_id: 1,
		brand_id: 6,
		function: "Office Chairs",
		remote_img_url:"https://www.hermanmiller.com/content/dam/hmi/hmidam/active/2016/08/11/REK_18171_20160811174151804.tif.rendition.992.992.jpg",
		description:"While its iconic form has remained largely unchanged, the Aeron chair has been remastered from the casters up to meet the needs of today’s work.",
		price: 1490,
		quantity: 20
	},
	{
		name:"HM Meet Cosm",
		category_id: 1,
		brand_id: 6,
		function: "Office Chairs",
		remote_img_url:"https://www.hermanmiller.com/content/dam/hmi/hmidam/active/2018/02/09/CSM_38858_20180209154124222.tif.rendition.992.992.jpg",
		description:"Its sophisticated ergonomic design instantly responds to your body, movement and posture to provide natural balance and total support.",
		price: 1490,
		quantity: 20
	},
	{
		name:"HM Embody Chairs",
		category_id: 1,
		brand_id: 6,
		function: "Office Chairs",
		remote_img_url:"https://www.hermanmiller.com/content/dam/hmi/hmidam/active/2014/09/01/LI_EMB_P_20140901_018.tif.rendition.992.992.jpg",
		description:"So intelligent, sitting in it actually helps you think",
		price: 1490,
		quantity: 20
	},

	### Ergohuman

	{
		name:"Ergohuman High Back Chair LE9ERG w/ Headrest and Leather",
		category_id: 1,
		brand_id: 7,
		function: "Office Chairs",
		remote_img_url:"https://cdn2.bigcommerce.com/server1400/ddaf1/products/34/images/146/Ergohuman-le9erg-chair__55272.1308750010.1280.1280.jpg?c=2",
		description:"The LE9ERG Raynor Ergohuman Chair is the all-leather version of the original Ergohuman Chair, featuring a high back and a headrest. The versatile ergonomic office chair offers a variety of features along with the added support of contoured cushions covered in durable black leather",
		price: 999,
		quantity: 20
	},
	{
		name:"Eurotech Racer Multifunction Chair FM4087",
		category_id: 1,
		brand_id: 7,
		function: "Office Chairs",
		remote_img_url:"https://cdn2.bigcommerce.com/server1400/ddaf1/products/77/images/355/1016415176_1___71099.1319214872.1280.1280.jpg?c=2",
		description:"If you want an office chair that goes beyond the basics of adjustment, try the Eurotech Racer Multifunction Chair FM4087. Unlike task chairs, this ergonomic chair features a multifunction mechanism that allows the back and seat to tilt and lock independently of one another",
		price: 999,
		quantity: 20
	},
	{
		name:"Raynor Ergo Elite Chair ME5ERGLTLOW",
		category_id: 1,
		brand_id: 7,
		function: "Office Chairs",
		remote_img_url:"https://cdn2.bigcommerce.com/server1400/ddaf1/products/97/images/593/Eurotech_Raynor_ErgoElite_ME5ERGLTLOW_MAIN__94447.1419963831.1280.1280.jpg?c=2",
		description:"The ME5ERGLTLOW Chair offers all of the same ergonomic features of the original Ergohuman V2 Chair with black arms and seat mechanism. The design of the ME5ERGLTLOW Raynor Ergo Elite Chair offers effortless adjustability, a high weight capacity and a more customized fit with features like five-position tilt lock and dynamic arms that slide forward and back",
		price: 999,
		quantity: 20
	},


	### Smugdesk
	{
		name:"SmugChair Leather Executive High Back Office Chair",
		category_id: 1,
		brand_id: 8,
		function: "Office Chairs",
		remote_img_url:"https://cdn.shopify.com/s/files/1/0055/2714/2490/products/1_6f044182-9d1b-4afa-bec7-aea00790761f_2048x2048.jpg?v=1564995692",
		description:"Our premium bonded leather executive chair offers phenomenal comfort and support with the features of an ergonomic chair, but with what you would expect from a leather executive chair",
		price: 180,
		quantity: 20
	},
	{
		name:"SmugChair Ergonomic Grey Mesh High Back Office Chair",
		category_id: 1,
		brand_id: 8,
		function: "Office Chairs",
		remote_img_url:"https://cdn.shopify.com/s/files/1/0055/2714/2490/products/1_6cf27d6d-9f0d-42d3-8a72-edc5a370cdfe_2048x2048.jpg?v=1562827701",
		description:"The Smugdesk high back office chair offers full support for the user, promoting comfort and support at an affordable price. Featuring an adjustable neck rest, tilt lock mechanism and lumbar pad, this chair provides value and comfort for the user.",
		price: 85,
		quantity: 20
	},
	{
		name:"SmugChair Ergonomic Mesh Office Chair",
		category_id: 1,
		brand_id: 8,
		function: "Office Chairs",
		remote_img_url:"https://cdn.shopify.com/s/files/1/0055/2714/2490/products/1_7da64fb3-7803-4f99-a7a8-7bbbe4c2f3b0_2048x2048.jpg?v=1563159703",
		description:"Featuring an adjustable neck rest, adjustable armrests, a tilt lock mechanism and enhanced lumbar cushioning, this chair provides value and comfort for the user.",
		price: 220,
		quantity: 20
	},
	{
		name:"SmugChair Full Recline Ergonomic Mesh High Back Office Chair",
		category_id: 1,
		brand_id: 8,
		function: "Office Chairs",
		remote_img_url:"https://cdn.shopify.com/s/files/1/0055/2714/2490/products/5_af6d6333-3278-42f2-a6e6-ab4f5369717b_2048x2048.jpg?v=1564994668",
		description:"The Smugdesk high back office chair offers full support for the user, promoting comfort and support at an affordable price. Featuring an adjustable neck rest, tilt lock mechanism and slide out foot rest, this chair provides value and comfort for the user.",
		price: 200,
		quantity: 20
	},

	### Humanscale

	{
		name:"Humanscale Summa",
		category_id: 1,
		brand_id: 9,
		function: "Office Chairs",
		remote_img_url:"https://www.humanscale.com/userFiles/images/seating/summa/summaproduct_6.jpg",
		description:"Designed for today’s most dynamic leaders, Summa is a versatile leather conference chair suitable for the corner office, the boardroom, as well as the home office",
		price: 4300,
		quantity: 20
	},
	{
		name:"Humanscale Freedom Headrest",
		category_id: 1,
		brand_id: 9,
		function: "Office Chairs",
		remote_img_url:"https://www.humanscale.com/userFiles/images/seating/freedomheadrest/17_humanscale_freedom_headrest_chair_prod1.jpg",
		description:"Described by The New York Times as the gold standard in office seating, the Freedom chair redefines the concept of traditional task chairs.",
		price: 1169,
		quantity: 20
	},
	{
		name:"Humanscale Liberty Task",
		category_id: 1,
		brand_id: 9,
		function: "Office Chairs",
		remote_img_url:"https://www.humanscale.com/userFiles/images/seating/libertytask/17_humanscale_liberty_1.jpg",
		description:"The Liberty Task chair is an intelligent mesh task chair engineered to provide automatic lumbar support for every user, as well offering simplicity and complete ease of use",
		price: 200,
		quantity: 20
	},
	{
		name:"Humanscale FREEDOM TASK CHAIR",
		category_id: 1,
		brand_id: 9,
		function: "Office Chairs",
		remote_img_url:"https://www.humanscale.com/userFiles/images/seating/freedomtask/17_humanscale_freedom_headrest_chair_prod2_jw.jpg",
		description:"Designed to complement any space and integrate effortlessly into the modern office, the Freedom task chair offers comfort, style and complete ease of use",
		price: 200,
		quantity: 20
	},

	{
		name:"Humanscale DIFFRIENT WORLD",
		category_id: 1,
		brand_id: 9,
		function: "Office Chairs",
		remote_img_url:"https://www.humanscale.com/userFiles/images/seating/world/diffrient_mesh_task_chair.jpg",
		description:"Diffrient World is Humanscale's first foray into all-mesh task seating. Designer Niels Diffrient wanted to create the most minimal, full-function task chair ever made",
		price: 919,
		quantity: 20
	},
])

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

# Billing.delete_all
# Billing.create!([
# 	{
# 		id: 1,
# 		user_id: 1,
# 		total: 3540.600,
# 		address: "210 Le Trong Tan, Phuong Mai, Ha Noi",
# 		created_at: "2019-10-20 16:22:41 UTC"
# 	},
# 	{
# 		id: 2,
# 		user_id: 1,
# 		total: 3540.600,
# 		address: "210 Le Trong Tan, Phuong Mai, Ha Noi",
# 		created_at: "2019-10-20 16:22:41 UTC"
# 	},
# 	{
# 		id: 3,
# 		user_id: 1,
# 		total: 3540.600,
# 		address: "210 Le Trong Tan, Phuong Mai, Ha Noi",
# 		created_at: "2019-10-20 16:22:41 UTC"
# 	},
# 	{
# 		id: 4,
# 		user_id: 1,
# 		total: 3540.600,
# 		address: "210 Le Trong Tan, Phuong Mai, Ha Noi",
# 		created_at: "2019-9-20 16:22:41 UTC"
# 	},
# 	{
# 		id: 5,
# 		user_id: 1,
# 		total: 3540.600,
# 		address: "210 Le Trong Tan, Phuong Mai, Ha Noi",
# 		created_at: "2019-9-20 16:22:41 UTC"
# 	},
# 	{
# 		id: 6,
# 		user_id: 1,
# 		total: 3539,
# 		address: "210 Le Trong Tan, Phuong Mai, Ha Noi"
# 	},
# 	{
# 		id: 7,
# 		user_id: 1,
# 		total: 3545,
# 		address: "210 Le Trong Tan, Phuong Mai, Ha Noi"
# 	},
# 	{
# 		id: 8,
# 		user_id: 1,
# 		total: 3545,
# 		address: "210 Le Trong Tan, Phuong Mai, Ha Noi",
# 		created_at: "2019-8-20 16:22:41 UTC"
# 	},
# 	{
# 		id: 9,
# 		user_id: 1,
# 		total: 3545,
# 		address: "210 Le Trong Tan, Phuong Mai, Ha Noi",
# 		created_at: "2019-7-20 16:22:41 UTC"
# 	},
# 	{
# 		id: 10,
# 		user_id: 1,
# 		total: 3545,
# 		address: "210 Le Trong Tan, Phuong Mai, Ha Noi",
# 		created_at: "2019-7-20 16:22:41 UTC"
# 	},
# 	{
# 		id: 11,
# 		user_id: 1,
# 		total: 3545,
# 		address: "210 Le Trong Tan, Phuong Mai, Ha Noi",
# 		created_at: "2019-7-20 16:22:41 UTC"
# 	}
	
# ])

ActiveRecord::Base.connection.tables.each do |t|
	ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
