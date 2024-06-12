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
    comments text
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
    comments text
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
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_user integer NOT NULL,
    name character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    telephone character varying(11) NOT NULL,
    role integer,
    balance integer
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
-- Name: users id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);


--
-- Data for Name: achievements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievements (id_achievement, name, description, prize) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id_product, name, description, price, linktofile) FROM stdin;
\.


--
-- Data for Name: request_for_coin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request_for_coin (id_request_for_coin, id_user, id_achievement, comments) FROM stdin;
\.


--
-- Data for Name: request_for_merch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request_for_merch (id_request_for_merch, id_user, id_product, comments) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_user, name, lastname, telephone, role, balance) FROM stdin;
\.


--
-- Name: achievements_id_achievement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.achievements_id_achievement_seq', 1, false);


--
-- Name: products_id_product_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_product_seq', 1, false);


--
-- Name: request_for_coin_id_request_for_coin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.request_for_coin_id_request_for_coin_seq', 1, false);


--
-- Name: request_for_merch_id_request_for_merch_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.request_for_merch_id_request_for_merch_seq', 1, false);


--
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_user_seq', 1, false);


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
-- Name: request_for_merch request_for_merch_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_for_merch
    ADD CONSTRAINT request_for_merch_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id_user);


--
-- PostgreSQL database dump complete
--

