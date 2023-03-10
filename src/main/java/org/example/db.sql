CREATE TABLE cafes (
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE dishes (
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    price NUMERIC CHECK ( price > 0)
);

CREATE TABLE clients(
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE orders (
    id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    cafe_id INT NOT NULL REFERENCES cafes(id),
    client_id INTEGER NOT NULL REFERENCES clients(id),
    dish_id INT NOT NULL REFERENCES dishes(id),
    order_time TIMESTAMP
);


INSERT INTO cafes (name, address) VALUES ('Navigator', 'ул. Московская, 103,');
INSERT INTO cafes (name, address) VALUES ('Очаг', 'ул. Огонбаева, 93');
INSERT INTO cafes (name, address) VALUES ('Миндаль', 'ул. Суюмбаева, 192');

INSERT INTO dishes (name, price) VALUES ('Блины со сгущенкой', 1200);
INSERT INTO dishes (name, price) VALUES ('Вареники с творогом', 1300);
INSERT INTO dishes (name, price) VALUES ('Омлет по-американски', 900);
INSERT INTO dishes (name, price) VALUES ('Овощное ассорти', 1500);
INSERT INTO dishes (name, price) VALUES ('Пельмени', 1600);
INSERT INTO dishes (name, price) VALUES ('Картофель фри', 1900);
INSERT INTO dishes (name, price) VALUES ('Горячий бутерброд (колбаса, сыр, помидор)', 2000);

INSERT INTO clients (name) VALUES ('John Smith');
INSERT INTO clients (name) VALUES ('Jane Doe');
INSERT INTO clients (name) VALUES ('Michael Johnson');
INSERT INTO clients (name) VALUES ('Emily Davis');
INSERT INTO clients (name) VALUES ('Matthew Miller');
INSERT INTO clients (name) VALUES ('Amanda Wilson');
INSERT INTO clients (name) VALUES ('Daniel Anderson');
INSERT INTO clients (name) VALUES ('Sarah Thomas');
INSERT INTO clients (name) VALUES ('Jessica Moore');
INSERT INTO clients (name) VALUES ('William Taylor');
INSERT INTO clients (name) VALUES ('Brian Martin');
INSERT INTO clients (name) VALUES ('Ashley Thompson');
INSERT INTO clients (name) VALUES ('David Garcia');
INSERT INTO clients (name) VALUES ('Rachel Martinez');
INSERT INTO clients (name) VALUES ('Kevin Robinson');

INSERT INTO orders (cafe_id, client_id, dish_id, order_time) VALUES
                                (1, 4, 1, '2022-12-01'),
                                (1, 12, 2, '2022-12-20'),
                                (2, 3, 2, '2022-12-11'),
                                (2, 11, 3, '2022-12-15'),
                                (3, 9, 3, '2022-12-18'),
                                (2, 2, 3, '2022-12-18'),
                                (3, 9, 4, '2022-12-18'),
                                (3, 9, 4, '2022-12-18'),
                                (3, 7, 5, '2022-12-27');

select * from dishes;
select * from orders;
select * from cafes;
select * from clients;

select orders.id, cafes.name, clients.name, dishes.name, price, order_time from orders
join cafes on(orders.cafe_id = cafes.id)
join clients on(orders.client_id = clients.id)
join dishes on(orders.dish_id = dishes.id);
