--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: achievements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievements (
    id_achievement integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    prize integer NOT NULL
);


ALTER TABLE public.achievements OWNER TO postgres;

--
-- Name: achievements_id_achievement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.achievements_id_achievement_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.achievements_id_achievement_seq OWNER TO postgres;

--
-- Name: achievements_id_achievement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.achievements_id_achievement_seq OWNED BY public.achievements.id_achievement;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id_product integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    price integer NOT NULL,
    linktofile text NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_product_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_product_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_product_seq OWNER TO postgres;

--
-- Name: products_id_product_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_product_seq OWNED BY public.products.id_product;


--
-- Name: request_for_coin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.request_for_coin (
    id_request_for_coin integer NOT NULL,
    id_user integer NOT NULL,
    id_achievement integer NOT NULL,
    comment_hr text,
    comment_s text,
    id_status integer
);


ALTER TABLE public.request_for_coin OWNER TO postgres;

--
-- Name: request_for_coin_id_request_for_coin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.request_for_coin_id_request_for_coin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.request_for_coin_id_request_for_coin_seq OWNER TO postgres;

--
-- Name: request_for_coin_id_request_for_coin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.request_for_coin_id_request_for_coin_seq OWNED BY public.request_for_coin.id_request_for_coin;


--
-- Name: request_for_merch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.request_for_merch (
    id_request_for_merch integer NOT NULL,
    id_user integer NOT NULL,
    id_product integer NOT NULL,
    comment_hr text,
    comment_s text,
    id_status integer
);


ALTER TABLE public.request_for_merch OWNER TO postgres;

--
-- Name: request_for_merch_id_request_for_merch_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.request_for_merch_id_request_for_merch_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.request_for_merch_id_request_for_merch_seq OWNER TO postgres;

--
-- Name: request_for_merch_id_request_for_merch_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.request_for_merch_id_request_for_merch_seq OWNED BY public.request_for_merch.id_request_for_merch;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id_role integer NOT NULL,
    pole_name character varying(100)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_role_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_role_seq OWNER TO postgres;

--
-- Name: role_id_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_role_seq OWNED BY public.role.id_role;


--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id_status integer NOT NULL,
    status_name character varying(100)
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Name: status_id_status_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.status_id_status_seq OWNER TO postgres;

--
-- Name: status_id_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_id_status_seq OWNED BY public.status.id_status;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_user integer NOT NULL,
    name character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    telephone character varying(11) NOT NULL,
    role integer,
    balance integer,
    id_role integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_user_seq OWNER TO postgres;

--
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;


--
-- Name: achievements id_achievement; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements ALTER COLUMN id_achievement SET DEFAULT nextval('public.achievements_id_achievement_seq'::regclass);


--
-- Name: products id_product; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id_product SET DEFAULT nextval('public.products_id_product_seq'::regclass);


--
-- Name: request_for_coin id_request_for_coin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_for_coin ALTER COLUMN id_request_for_coin SET DEFAULT nextval('public.request_for_coin_id_request_for_coin_seq'::regclass);


--
-- Name: request_for_merch id_request_for_merch; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_for_merch ALTER COLUMN id_request_for_merch SET DEFAULT nextval('public.request_for_merch_id_request_for_merch_seq'::regclass);


--
-- Name: role id_role; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id_role SET DEFAULT nextval('public.role_id_role_seq'::regclass);


--
-- Name: status id_status; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN id_status SET DEFAULT nextval('public.status_id_status_seq'::regclass);


--
-- Name: users id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);


--
-- Data for Name: achievements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievements (id_achievement, name, description, prize) FROM stdin;
1	Реализация улучшений работы команды	За предложение идей для улучшения работы команды (только принятые идеи) 1-3 коина	1
2	Оптимизация работы направления и задач отдела	1-3 коина	1
3	Организация тимбилдингов	1-3 коина	1
4	Работа наставником с практикантами	2 коина	2
5	Работа со стажером	10 коинов	10
6	Выступление с докладом на внешних конференциях с упоминанием компании/бренда	20 коинов	20
7	Доклад на внутренних митапах	10 коинов	1
8	Получение сертификата об образовании с затраченным временем более 20 часов	1 коин за 8 часов	1
9	Реализация идей по улучшению работы отдела	1 коин за 3 сниппета	1
10	Статья на внешнем ресурсе с упоминанием компании/бренда	 1 коинов за 2500	1
11	Интервью, комментарии	1 коин за неопубликованный комментарий, 3 коина за СМИ 2 эшелона, 5 коинов за СМИ 1 эшелона	1
12	Организация проведения обучений	1 коин за 5 участников	1
13	Организация мероприятия с участием сотрудников компании.	1 коин за 10 участников	1
14	Получение призового места на хакатоне	20 коинов	20
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id_product, name, description, price, linktofile) FROM stdin;
2	Наклейки	Набор наклеек Simpl	1	
3	Значок	Значок компании	1	
4	Кружка	Кружка с логотипом	4	
5	Шапка	Ушанка	4	
6	Подставка	Подставка для кружки	4	
7	Кепка	Кружка с логотипом	4	
9	Рюкзак	Для ноута	8	
10	Бутылка для воды	Шейкер	8	
11	Футболка	Футболка с принтом Simlp	10	
12	Powerbank	Для телефона	12	
13	Толстовка	Толстовка с принтом Simlp	20	
8	Бандана	Кизару	4	
\.


--
-- Data for Name: request_for_coin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request_for_coin (id_request_for_coin, id_user, id_achievement, comment_hr, comment_s, id_status) FROM stdin;
1	1	1	Все ок	Посмотри	3
2	2	2	Нет инфы	Вот так	2
\.


--
-- Data for Name: request_for_merch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request_for_merch (id_request_for_merch, id_user, id_product, comment_hr, comment_s, id_status) FROM stdin;
3	1	2	Ок	размер	1
4	2	3	Приходи	цвет	3
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id_role, pole_name) FROM stdin;
1	сотрудник
2	администратор
3	HR
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id_status, status_name) FROM stdin;
1	в обработке
2	отклонено
3	принято
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_user, name, lastname, telephone, role, balance, id_role) FROM stdin;
1	Иван	Иванов	12345678901	1	3	1
2	Мария	Петрова	23456789012	2	5	2
3	Алексей	Сидоров	34567890123	3	0	3
\.


--
-- Name: achievements_id_achievement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.achievements_id_achievement_seq', 14, true);


--
-- Name: products_id_product_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_product_seq', 13, true);


--
-- Name: request_for_coin_id_request_for_coin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.request_for_coin_id_request_for_coin_seq', 2, true);


--
-- Name: request_for_merch_id_request_for_merch_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.request_for_merch_id_request_for_merch_seq', 4, true);


--
-- Name: role_id_role_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_role_seq', 3, true);


--
-- Name: status_id_status_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_id_status_seq', 3, true);


--
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_user_seq', 3, true);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id_achievement);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id_product);


--
-- Name: request_for_coin request_for_coin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_for_coin
    ADD CONSTRAINT request_for_coin_pkey PRIMARY KEY (id_request_for_coin);


--
-- Name: request_for_merch request_for_merch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_for_merch
    ADD CONSTRAINT request_for_merch_pkey PRIMARY KEY (id_request_for_merch);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id_status);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- Name: users users_telephone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_telephone_key UNIQUE (telephone);


--
-- Name: request_for_coin request_for_coin_id_achievement_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_for_coin
    ADD CONSTRAINT request_for_coin_id_achievement_fkey FOREIGN KEY (id_achievement) REFERENCES public.achievements(id_achievement);


--
-- Name: request_for_coin request_for_coin_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_for_coin
    ADD CONSTRAINT request_for_coin_id_status_fkey FOREIGN KEY (id_status) REFERENCES public.status(id_status);


--
-- Name: request_for_coin request_for_coin_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_for_coin
    ADD CONSTRAINT request_for_coin_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id_user);


--
-- Name: request_for_merch request_for_merch_id_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_for_merch
    ADD CONSTRAINT request_for_merch_id_product_fkey FOREIGN KEY (id_product) REFERENCES public.products(id_product);


--
-- Name: request_for_merch request_for_merch_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_for_merch
    ADD CONSTRAINT request_for_merch_id_status_fkey FOREIGN KEY (id_status) REFERENCES public.status(id_status);


--
-- Name: request_for_merch request_for_merch_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_for_merch
    ADD CONSTRAINT request_for_merch_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id_user);


--
-- Name: users users_id_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.role(id_role);


--
-- PostgreSQL database dump complete
--

