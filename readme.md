
        PostgreSQL-প্রশ্ন ও উত্তর

১.Explain the Primary Key and Foreign Key concepts in PostgreSQL.

উত্তর:
প্রাইমারি কি:
এক বা একাধিক কলাম মিলে যখন কোনো একটি টেবিলের প্রত্যেকটি সারিকে uniquely সনাক্ত করা যায় তাহলে সেই সকল কলাম বা কলামগুলোকে প্রাইমারি কি বলা হয়।প্রাইমারি কি সর্বদা প্রত‌্য়েক সারির জন্য unique হবে এবং null হতে পারবে না । উদাহরন:
        CREATE TABLE rangers (
        ranger_id SERIAL PRIMARY KEY,
        name VARCHAR(50)
        );

এখানে ranger_id একটি প্রাইমারি কি।

ফরেন কি:
যখন একটি টেবিলের কলাম অন্য একটি টেবিলের প্রাইমারি কি হয় তখন সেই কলাম কে ফরেন কি বলা হয়।
উদাহরন:
  CREATE TABLE rangers (
        ranger_id SERIAL PRIMARY KEY,
        name VARCHAR(50)
        ); 
    CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    location VARCHAR(100)
    );

এখানে ranger_id একটি ফরেন কি। কারন এটি rangers টেবিলের প্রাইমারি কি।


২.What is the difference between the VARCHAR and CHAR data types?
উত্তর:
VARCHAR variable এর জন্য যতটুকু জায়গা প্রয়োজন ততটুকু নেয়‌‌। অন্যদিকে 
CHAR এ সবসময়  নিদিষ্ট  পরিমান জায়গা নেয়। ফাকা জায়গা থাকলে তা space দ্বারা পূরন করে।

৩.Explain the purpose of the WHERE clause in a SELECT statement.

উত্তর: কোনো টেবিল থেকে নির্দিষ্ট শর্ত পূরণ করা রেকর্ডগুলো বাছাই করার জন্য WHERE clause ব্যবহার করা হয়।
উদাহরন:
        SELECT * FROM rangers WHERE region = 'Coastal Plains';

৪.What are the LIMIT and OFFSET clauses used for?

উত্তর:
Limit:কোনো কুয়েরিতে কতগুলো ফলাফল বা রেকর্ড নিয়ে আসবে তার জন্য Limit ব্যবহার করা হয়।
OFFSET: শুরুতে কতগুলো রেকর্ড বাদ দিবে অথবা  স্কিপ করবে তা নির্ধারণ করে OFFSET.উদাহরন:
    SELECT * FROM sightings ORDER BY sighting_time LIMIT 3 OFFSET 5;

এখানে,প্রথম ৫টি রেকর্ড বাদ দিবে,তার পরের ৩টি রেকর্ড দেখাবে।


৫.How can you modify data using UPDATE statements?
উত্তর:কোনো টেবিলের আগে থেকে থাকা কোনো ডেটা পরিবর্তন করার জন্য modify ব্যবহার করা হয়।উদাহরন:
    UPDATE rangers
    SET region = 'Mountain Area'
    WHERE ranger_id = 3;

এটি rangers টেবিলের ranger_id 3 এর তথ্য পরিবর্তন করবে।
