CREATE DATABASE Nohope;
USE Nohope;

CREATE TABLE product (
    productid VARCHAR(3) PRIMARY KEY,
    productname NVARCHAR(50) NOT NULL,
    size NVARCHAR(4) NOT NULL,
	-- S : 0
	-- M : 1
	-- L : 2
	-- XL : 3
	color nvarchar(7) not null,
	-- Black: 0
	-- White: 1
	--Blue: 2
	-- Green: 3
	--Yellow: 4 
	-- Brown: 5
	--Gray: 6
	price int,
   -- leftquantity INT,
    imagelink NVARCHAR(20) NOT NULL,
    categoryid NVARCHAR(3) NOT NULL,
	description1 NVARCHAR (255) NOT NULL,
	description2 NVARCHAR (255) NOT NULL,
	description3 NVARCHAR (255) NOT NULL

	--N01 : Nam
	--W01: Nu
	--U01: Unisex
);

CREATE TABLE account (
    username NVARCHAR(20) PRIMARY KEY,
    fullname NVARCHAR(50) NOT NULL,
    password NVARCHAR(50) NOT NULL,
    phonenumber NVARCHAR(50) NOT NULL,
	role bit not null
);

SELECT * from account

INSERT INTO account VALUES ('kha', '2', '3', '0123456789', '1')



CREATE TABLE orders (
    orderid INT PRIMARY KEY IDENTITY(1,1),
    quantity INT NOT NULL,
	price float NOT NULL,
    totalprice float NOT NULL,
	phonenumber NVARCHAR(10) NOT NULL,
    address NVARCHAR(50) NOT NULL,
    username NVARCHAR(20) ,
    productid VARCHAR(3),
	fullname NVARCHAR(50),
	size NVARCHAR(4) NOT NULL, 
	color nvarchar(7) not null,
    FOREIGN KEY (username) REFERENCES account(username),
    FOREIGN KEY (productid) REFERENCES product(productid)
);

SELECT * From orders





INSERT INTO product (productid, productname, size, color, price, imagelink, categoryid, description1, description2, description3)
VALUES
('N01', 'Punk Jacket', '1', '0', 199.0, 'images/AKN-5.jpeg', 'M', 
'	/Punk Jacket - BRING BACK HOPE-REVO - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality Felt, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),
('N02', 'Badboy Jacket', '01', '016', 199.0, 'images/AKN-6.jpg', 'M',
'	/Badboy - BRING BADBOY TO YOUR LIFE- modern personality badboy style. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand Loucha.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Cotton
	/Made in Viet Nam
	/Technical in: In High'
),
('N03', 'Play Boy Jacket', '012', '01', 299.0, 'images/AKN-7.jpg', 'M',
'	/Play Boy - BRING PLAYBOY TO YOUR LIFE- modern personality playboy style. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand Gucchi.
	/Fashionable oversize shirt form
	/High quality, cool and comfortable, make the wearer feel stylish and active.
	/Fashionable oversize shirt form, sturdy neckline',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Cotton
	/Made in Thailand
	/Technical in: In High'
),
('N04', 'Climbing Jacket', '0123', '12', 299.0, 'images/AKN-8.jpg', 'M',
'	/Climbing Jacket - BRING THE MOUNTAIN IN FRONT OF YOU - Modern and stylish, very suitable for climbing.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality Leather material, moisture-proof, anti-sweat.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Leather
	/Made in Viet Nam
	/Technical in: In High'
),
('N05', 'Jean Jacket', '01', '23', 259.0, 'images/AKN-5.jpg', 'M',
'	/Jean Jacket - BRING JENNY KANG to NOX AOV - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/The quality of the jeans is torn, just like Jenny Kang s personality',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Jean
	/Made in Viet Nam
	/Technical in: In High'
),
('N06', 'Cotton Jacket', '012', '02', 259.0, 'images/AKN-1.jpg', 'M',
'	/Cotton Jacket - SOFT LIKE COTTON - The outfit looks rough but is very soft, showing the personality of the wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Cotton
	/Made in Japanese
	/Technical in: In High'
),
('N07', 'Half Jean Jacket', '0123', '24', 249.0, 'images/AKN-2.jpg', 'M',
'	/Half Jane Jacket - BRING MEMORY FROM THE PAST - modern personality style but, stylish, youthful.',
'	/Produced by fashion brand HOPE.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality semi-jean fabric, not rough and very face-friendly.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Jean, Cotton
	/Made in China
	/Technical in: In High'
),
('N08', 'Sport Jacket', '01', '015', 249.0, 'images/AKN-3.jpg', 'M',
'	/Sport Jacket - COOL AND DYNAMIC - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),
('N09', 'Fashion Jean Jacket', '012', '56', 149.0, 'images/AKN-4.jpg', 'M',
'	/Fashion Jacket - FASHION BUT NOT FASHION - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),
('W01', 'Street Girl Jacket', '0123', '035', 179.0, 'images/AKW-1.jpeg', 'W',
'	/Street Girl Jacket - STREET GIRL AND SWEET TRAP - A young dynamic girl wearing this outfit will make people fall in love.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Cotton
	/Made in Viet Nam
	/Technical in: In High'
),

('W02', 'Go out Jacket', '01', '15', 199.0, 'images/AKW-2.jpeg', 'W',
'	/Go out Jacket - BRING HEIBORGHOOD TO YOUR  - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),
('W03', 'Cute Jacket', '012', '16', 299.0, 'images/HDN-2.jpeg', 'W',
'	/Cute Jacket - BRING CUTE GIRL TO YOUR LIFE - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Cotton
	/Made in Viet Nam
	/Technical in: In High'
),
('W04', 'Lovely Jacket', '0123', '14', 199.0, 'images/HDN-1.jpeg', 'W',
'	/Lovely Jacket - LOVELY GIRL - SHINING SKY - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),
('W05', 'Fashion Jacket', '01', '0', 139.0, 'images/AKW-4.jpg', 'W',
'	/Fashion Jacket - BRING BACK HOPE-REVO - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),
('W06', 'Jean Girl jacket', '012', '2', 119.0, 'images/JEAN-1.jpeg', 'W',
'	/Jean Jacket - JEAN GIRL, FANCY STYLE- modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Jean
	/Made in Viet Nam
	/Technical in: In High'
),
('W07', 'Office Jacket', '0123', '4', 119.0, 'images/AKW-3.jpg', 'W',
'	/Office Jacket - MODERN OFFICER IN DAYLY LIFE - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Cotton
	/Made in America
	/Technical in: In High'
),
('W08', 'Hoodie', '01', '25', 79.0, 'images/AKW-5.jpg', 'W',
'	/Hoodie Jacket - WARM AND SOFT FOR WOMEN - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),
('W09', 'Semi Jacket', '012', '124', 149.0, 'images/AKW-6.jpeg', 'W',
'	/Semi Jacket - SEMI JACKET PROVE YOU CONVINIENT - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Cotton, Jean
	/Made in Viet Nam
	/Technical in: In High'
),
('W10', 'Sport Girl Jacket', '0123', '0123456', 219.0, 'images/AKW-7.jpg', 'W',
'	/Sport Girl Jacket - DYNAMIC GIRLS - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),
('W11', 'Neko Hoodie', '01', '36', 189.0, 'images/AKW-8.jpeg', 'W',
'	/Neko Jacket - MEOWWWWWW! CUTE CAT WILL BESIDE YOU - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),

('U01', 'Cool Unisex Jacket', '012', '014', 159.0, 'images/UNISEX-4.jpeg', 'U',
'	/Cool Unisex Jacket - COOL AND RECIPE - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),
('U02', 'Cute Unisex Jacket', '0123', '246', 169.0, 'images/UNISEX-3.webp', 'U',
'	/Cute Unisex Jacket - CUTE COUPLE - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Cotton
	/Made in China
	/Technical in: In High'
),
('U03', 'Student Unisex Jacket', '01', '123', 169.0, 'images/UNISEX-1.webp', 'U',
'	/Student Unisex Jacket - STUDENT JACKET - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),
('U04', 'Sport Unisex Jacket', '012', '145', 159.0, 'images/UNISEX-2.webp', 'U',
'	/Sport Unisex Jacket - FANTASTIC SPORTS KITS- modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality kaki, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Kaki
	/Made in Viet Nam
	/Technical in: In High'
),
('U05', 'Go out Unisex Jacket', '0123', '236', 159.0, 'images/UNISEX-5.jpeg', 'U',
'	/Go out Jacket - BE THE BEST WAY - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),
('U06', 'Gamer Unisex Jacket', '01', '12', 189.0, 'images/UNISEX-6.jpeg', 'U',
'	/Gamer Unisex Jacket - YOUR LIFE IS A RISK GAME - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Cotton
	/Made in Viet Nam
	/Technical in: In High'
),
('U07', 'Dancing Unisex Jacket', '012', '3', 189.0, 'images/UNISEX-7.jpeg', 'U',
'	/Dancing Unisex Jacket - DANCING IN THE MOON - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
),
('U08', 'Street Unisex Jacket', '0123', '2', 999.0, 'images/UNISEX-8.jpeg', 'U',
'	/Street Jacket - STREET FIGHTER - modern personality style but, stylish, youthful. Subtle buttons with detailed display in high fashion. Especially the cuffs and hem of the shirt, the shirt collar hugs the body of the luxurious wearer.',
'	/Produced by fashion brand HOPE.
	/Highlight effect created a clear 3D effect.
	/Fashionable oversize shirt form, sturdy neckline
	/Quality cotton, cool, good sweat absorption.',
'	/Proportional stitching, finishing.
	/Return in 30 days - Warranty up to 90 days.
	/Material: Felt
	/Made in Viet Nam
	/Technical in: In High'
);