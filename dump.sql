--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO nekwebshop;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO nekwebshop;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO nekwebshop;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO nekwebshop;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    city character varying,
    street character varying,
    state character varying,
    country character varying,
    zip character varying,
    suburb character varying,
    county character varying,
    shop_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    order_id integer
);


ALTER TABLE public.addresses OWNER TO nekwebshop;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO nekwebshop;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO nekwebshop;

--
-- Name: attributes; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.attributes (
    id bigint NOT NULL,
    name character varying,
    text character varying,
    num double precision,
    product_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "check" boolean,
    type_name character varying,
    hint character varying,
    code integer
);


ALTER TABLE public.attributes OWNER TO nekwebshop;

--
-- Name: attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attributes_id_seq OWNER TO nekwebshop;

--
-- Name: attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.attributes_id_seq OWNED BY public.attributes.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    product_id integer,
    user_id integer,
    quantity integer,
    uuid character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.carts OWNER TO nekwebshop;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_id_seq OWNER TO nekwebshop;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying,
    data character varying,
    ancestry character varying,
    is_template boolean DEFAULT false
);


ALTER TABLE public.categories OWNER TO nekwebshop;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO nekwebshop;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: categories_makers; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.categories_makers (
    id bigint NOT NULL,
    category_id bigint,
    maker_id bigint
);


ALTER TABLE public.categories_makers OWNER TO nekwebshop;

--
-- Name: categories_makers_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.categories_makers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_makers_id_seq OWNER TO nekwebshop;

--
-- Name: categories_makers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.categories_makers_id_seq OWNED BY public.categories_makers.id;


--
-- Name: makers; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.makers (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    is_another boolean
);


ALTER TABLE public.makers OWNER TO nekwebshop;

--
-- Name: makers_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.makers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.makers_id_seq OWNER TO nekwebshop;

--
-- Name: makers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.makers_id_seq OWNED BY public.makers.id;


--
-- Name: ordered_products; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.ordered_products (
    id bigint NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    data text,
    title character varying,
    description text,
    price double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ordered_products OWNER TO nekwebshop;

--
-- Name: ordered_products_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.ordered_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ordered_products_id_seq OWNER TO nekwebshop;

--
-- Name: ordered_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.ordered_products_id_seq OWNED BY public.ordered_products.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id integer,
    name character varying,
    surname character varying,
    phone character varying,
    email character varying,
    shop_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO nekwebshop;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO nekwebshop;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: orders_products; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.orders_products (
    id bigint NOT NULL,
    order_id integer,
    product_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    quantity integer
);


ALTER TABLE public.orders_products OWNER TO nekwebshop;

--
-- Name: orders_products_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.orders_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_products_id_seq OWNER TO nekwebshop;

--
-- Name: orders_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.orders_products_id_seq OWNED BY public.orders_products.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    user_id integer,
    product_id integer,
    body text,
    mark integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    ancestry character varying
);


ALTER TABLE public.posts OWNER TO nekwebshop;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO nekwebshop;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    title character varying,
    price double precision,
    maker_name character varying,
    custom_maker boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    category_id integer,
    maker_id integer,
    shop_id integer,
    description text,
    quantity integer,
    is_inf_quantity boolean,
    mark double precision DEFAULT 0.0
);


ALTER TABLE public.products OWNER TO nekwebshop;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO nekwebshop;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO nekwebshop;

--
-- Name: shops; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.shops (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    top_cat character varying DEFAULT '[]'::character varying,
    mail character varying,
    description text,
    phone character varying,
    user_id integer,
    inn character varying,
    vk character varying,
    fb character varying,
    tg character varying,
    wu character varying
);


ALTER TABLE public.shops OWNER TO nekwebshop;

--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shops_id_seq OWNER TO nekwebshop;

--
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.shops_id_seq OWNED BY public.shops.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying,
    phone character varying,
    name character varying,
    surname character varying,
    password_digest character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    restore_date timestamp without time zone,
    street character varying,
    city character varying,
    state character varying,
    country character varying,
    zip integer,
    suburb character varying,
    county character varying,
    restore_code character varying,
    restore_code_task_started timestamp without time zone,
    confirmed boolean,
    email_temp character varying,
    email_temp_code character varying,
    change_code_task_started timestamp without time zone,
    third_name character varying
);


ALTER TABLE public.users OWNER TO nekwebshop;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO nekwebshop;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wishes; Type: TABLE; Schema: public; Owner: nekwebshop
--

CREATE TABLE public.wishes (
    id bigint NOT NULL,
    user_id integer,
    product_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.wishes OWNER TO nekwebshop;

--
-- Name: wishes_id_seq; Type: SEQUENCE; Schema: public; Owner: nekwebshop
--

CREATE SEQUENCE public.wishes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wishes_id_seq OWNER TO nekwebshop;

--
-- Name: wishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nekwebshop
--

ALTER SEQUENCE public.wishes_id_seq OWNED BY public.wishes.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: attributes id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.attributes ALTER COLUMN id SET DEFAULT nextval('public.attributes_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: categories_makers id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.categories_makers ALTER COLUMN id SET DEFAULT nextval('public.categories_makers_id_seq'::regclass);


--
-- Name: makers id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.makers ALTER COLUMN id SET DEFAULT nextval('public.makers_id_seq'::regclass);


--
-- Name: ordered_products id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.ordered_products ALTER COLUMN id SET DEFAULT nextval('public.ordered_products_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: orders_products id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.orders_products ALTER COLUMN id SET DEFAULT nextval('public.orders_products_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: shops id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.shops ALTER COLUMN id SET DEFAULT nextval('public.shops_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wishes id; Type: DEFAULT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.wishes ALTER COLUMN id SET DEFAULT nextval('public.wishes_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	main_photo	Product	1	1	2020-07-20 10:10:07.589571
3	main_photo	Product	3	3	2020-07-20 10:13:58.46008
19	main_photo	Product	19	19	2020-07-21 14:48:14.337721
20	images	Attribute	39	20	2020-07-21 14:48:14.440206
21	main_photo	Product	20	21	2020-07-21 15:31:33.987969
22	images	Attribute	42	22	2020-07-21 15:31:34.109003
23	main_photo	Product	21	23	2020-07-21 15:32:36.966463
24	images	Attribute	45	24	2020-07-21 15:32:37.015946
25	main_photo	Product	22	25	2020-07-21 16:59:35.652372
58	main_photo	Product	55	58	2020-07-24 10:26:32.112994
59	images	Attribute	82	59	2020-07-24 10:26:32.473881
60	main_photo	Product	56	60	2020-07-24 10:28:10.502131
61	main_photo	Product	57	61	2020-07-24 10:50:58.595787
62	images	Attribute	89	62	2020-07-24 10:50:58.658318
63	main_photo	Product	58	63	2020-07-24 10:53:30.716622
64	images	Attribute	92	64	2020-07-24 10:53:30.767765
65	main_photo	Product	59	65	2020-07-24 10:57:26.920527
66	main_photo	Product	60	66	2020-07-24 11:03:52.384292
67	main_photo	Product	61	67	2020-07-24 11:05:21.676689
68	main_photo	Product	62	68	2020-07-24 11:05:23.676884
69	main_photo	Product	63	69	2020-07-24 11:05:24.530805
70	main_photo	Product	64	70	2020-07-24 11:05:25.205038
71	main_photo	Product	65	71	2020-07-24 11:05:25.724463
72	main_photo	Product	66	72	2020-07-24 11:05:26.94841
73	main_photo	Product	67	73	2020-07-24 11:07:20.004972
74	main_photo	Product	68	74	2020-07-24 11:08:25.517889
75	main_photo	Product	69	75	2020-07-24 11:08:54.199674
76	main_photo	Product	70	76	2020-07-24 11:09:04.373393
77	main_photo	Product	71	77	2020-07-24 11:09:05.59285
78	main_photo	Product	72	78	2020-07-24 11:09:08.686403
79	main_photo	Product	73	79	2020-07-24 11:09:09.985022
80	main_photo	Product	74	80	2020-07-24 11:09:10.483552
81	main_photo	Product	75	81	2020-07-24 11:09:10.891051
82	main_photo	Product	76	82	2020-07-24 11:09:11.228096
83	main_photo	Product	77	83	2020-07-24 11:09:11.5539
84	main_photo	Product	78	84	2020-07-24 11:09:11.868865
85	main_photo	Product	79	85	2020-07-24 11:09:12.116237
86	main_photo	Product	80	86	2020-07-24 11:09:12.460463
87	main_photo	Product	81	87	2020-07-24 11:09:12.771511
88	main_photo	Product	82	88	2020-07-24 11:09:37.013461
89	main_photo	Product	83	89	2020-07-24 11:09:53.693623
90	main_photo	Product	84	90	2020-07-24 11:10:10.210584
91	main_photo	Product	85	91	2020-07-24 11:13:35.586881
92	images	Attribute	121	92	2020-07-24 11:13:35.676355
93	images	Attribute	121	93	2020-07-24 11:13:35.682363
94	images	Attribute	121	94	2020-07-24 11:13:35.688234
95	main_photo	Product	86	95	2020-07-24 11:52:14.23848
96	main_photo	Product	87	96	2020-07-24 11:54:04.056331
97	main_photo	Product	88	97	2020-07-24 11:55:31.419815
98	images	Attribute	126	98	2020-07-24 11:55:31.5353
99	images	Attribute	126	99	2020-07-24 11:55:31.542027
100	images	Attribute	126	100	2020-07-24 11:55:31.546355
101	images	Attribute	126	101	2020-07-24 11:55:31.551314
102	images	Attribute	126	102	2020-07-24 11:55:31.557824
103	images	Attribute	126	103	2020-07-24 11:55:31.564271
104	images	Attribute	126	104	2020-07-24 11:55:31.570601
105	main_photo	Product	89	105	2020-07-24 12:58:09.210126
106	images	Attribute	129	106	2020-07-24 12:58:09.31322
107	images	Attribute	129	107	2020-07-24 12:58:09.32537
108	main_photo	Product	90	108	2020-07-24 12:59:01.973375
109	images	Attribute	132	109	2020-07-24 12:59:02.05614
110	images	Attribute	132	110	2020-07-24 12:59:02.065439
111	main_photo	Product	91	111	2020-07-24 12:59:38.296867
112	images	Attribute	135	112	2020-07-24 12:59:38.354375
113	main_photo	Product	92	113	2020-07-24 13:01:13.59174
114	main_photo	Product	93	114	2020-07-24 13:01:32.915878
115	main_photo	Product	94	115	2020-07-24 13:01:42.416427
116	images	Attribute	140	116	2020-07-24 13:01:42.472556
117	main_photo	Product	95	117	2020-07-24 13:04:26.585327
118	main_photo	Product	96	118	2020-07-24 13:04:37.52953
119	images	Attribute	145	119	2020-07-24 13:04:37.621568
120	main_photo	Product	97	120	2020-07-24 13:08:25.331415
121	images	Attribute	148	121	2020-07-24 13:08:25.427544
122	images	Attribute	148	122	2020-07-24 13:08:25.434566
123	images	Attribute	148	123	2020-07-24 13:08:25.439501
124	main_photo	Product	98	124	2020-07-24 13:10:03.869358
125	images	Attribute	151	125	2020-07-24 13:10:03.952209
126	images	Attribute	151	126	2020-07-24 13:10:03.956808
127	images	Attribute	151	127	2020-07-24 13:10:03.962746
128	main_photo	Product	99	128	2020-07-24 13:11:38.874809
129	main_photo	Product	100	129	2020-07-24 13:12:58.957747
130	main_photo	Product	101	130	2020-07-24 13:14:34.250489
131	images	Attribute	159	131	2020-07-24 13:14:34.31108
132	main_photo	Product	102	132	2020-07-24 13:14:46.717392
133	images	Attribute	163	133	2020-07-24 13:14:46.78359
134	main_photo	Product	103	134	2020-07-24 13:14:54.444868
135	main_photo	Product	104	135	2020-07-25 09:04:27.99973
136	images	Attribute	170	136	2020-07-25 09:04:28.147538
137	images	Attribute	170	137	2020-07-25 09:04:28.154466
138	images	Attribute	170	138	2020-07-25 09:04:28.159117
139	main_photo	Product	105	139	2020-07-25 09:42:29.053069
140	images	Attribute	173	140	2020-07-25 09:42:29.122892
141	main_photo	Product	106	141	2020-07-25 09:46:58.32255
142	images	Attribute	176	142	2020-07-25 09:46:58.599895
143	images	Attribute	176	143	2020-07-25 09:46:58.609363
144	images	Attribute	176	144	2020-07-25 09:46:58.616417
145	main_photo	Product	107	145	2020-07-25 09:52:16.061926
146	main_photo	Product	108	146	2020-07-25 09:52:45.857269
147	main_photo	Product	109	147	2020-07-25 09:53:03.137761
148	main_photo	Product	110	148	2020-07-25 09:58:10.147739
149	main_photo	Product	111	149	2020-07-26 09:59:43.268866
150	images	Attribute	188	150	2020-07-26 09:59:43.79862
151	main_photo	Product	112	151	2020-07-26 10:18:36.19695
152	main_photo	Product	113	152	2020-07-26 10:30:05.739775
153	images	Attribute	193	153	2020-07-26 10:30:05.800341
154	main_photo	Product	114	154	2020-07-27 07:15:50.555099
155	main_photo	Product	115	155	2020-07-27 07:18:23.47092
156	images	Attribute	200	156	2020-07-27 07:18:25.016375
157	images	Attribute	200	157	2020-07-27 07:18:25.024009
158	images	Attribute	200	158	2020-07-27 07:18:25.033091
159	main_photo	Product	116	159	2020-07-27 07:21:31.219516
160	images	Attribute	203	160	2020-07-27 07:21:31.297267
161	images	Attribute	203	161	2020-07-27 07:21:31.304403
162	images	Attribute	203	162	2020-07-27 07:21:31.311332
163	main_photo	Product	117	163	2020-07-27 15:55:49.471407
164	images	Attribute	206	164	2020-07-27 15:55:49.908405
165	main_photo	Product	118	165	2020-07-27 16:00:41.995101
166	main_photo	Product	119	166	2020-07-27 16:14:19.446609
167	images	Attribute	215	167	2020-07-27 16:14:19.555463
168	images	Attribute	215	168	2020-07-27 16:14:19.561848
169	images	Attribute	215	169	2020-07-27 16:14:19.568977
170	main_photo	Product	120	170	2020-07-28 10:05:50.289622
171	main_photo	Product	121	171	2020-07-28 10:07:32.485643
172	images	Attribute	218	172	2020-07-28 10:07:32.591065
173	images	Attribute	218	173	2020-07-28 10:07:32.596394
174	images	Attribute	218	174	2020-07-28 10:07:32.603986
175	main_photo	Product	122	175	2020-07-28 11:34:17.613856
176	main_photo	Product	123	176	2020-07-28 12:08:54.623372
177	main_photo	Product	124	177	2020-07-28 12:13:02.756071
178	main_photo	Product	125	178	2020-07-29 10:37:54.311581
179	images	Attribute	235	179	2020-07-29 10:37:54.729455
180	images	Attribute	235	180	2020-07-29 10:37:54.747634
181	images	Attribute	235	181	2020-07-29 10:37:54.757785
182	main_photo	Product	126	182	2020-07-29 10:53:59.050296
183	files	Attribute	240	183	2020-07-29 10:53:59.137958
184	files	Attribute	240	184	2020-07-29 10:53:59.143217
185	files	Attribute	240	185	2020-07-29 10:53:59.148819
186	main_photo	Product	127	186	2020-07-29 11:11:15.566227
188	files	Attribute	248	188	2020-07-30 08:11:07.721952
189	files	Attribute	248	189	2020-07-30 08:11:07.726831
190	files	Attribute	248	190	2020-07-30 08:11:07.736567
191	images	Post	1	191	2020-08-01 15:34:37.726486
192	images	Post	1	192	2020-08-01 15:34:37.750492
193	images	Post	1	193	2020-08-01 15:34:37.755494
194	images	Post	2	194	2020-08-01 15:34:59.221015
195	images	Post	2	195	2020-08-01 15:34:59.230265
196	images	Post	2	196	2020-08-01 15:34:59.235579
197	images	Post	3	197	2020-08-01 15:37:29.313377
198	images	Post	3	198	2020-08-01 15:37:29.322089
199	images	Post	3	199	2020-08-01 15:37:29.33141
200	images	Post	4	200	2020-08-01 15:37:55.799476
201	images	Post	4	201	2020-08-01 15:37:55.804509
202	images	Post	4	202	2020-08-01 15:37:55.80971
203	images	Post	5	203	2020-08-01 15:39:10.813819
204	images	Post	6	204	2020-08-01 15:39:43.676148
205	images	Post	6	205	2020-08-01 15:39:43.684818
206	images	Post	6	206	2020-08-01 15:39:43.689893
207	images	Post	7	207	2020-08-01 15:39:59.226042
208	images	Post	10	208	2020-08-01 16:10:24.283262
209	images	Post	10	209	2020-08-01 16:10:24.290137
210	images	Post	10	210	2020-08-01 16:10:24.295248
211	main_photo	Product	129	211	2020-08-01 16:48:56.817539
244	images	Post	12	244	2020-08-02 13:15:28.844258
245	images	Post	12	245	2020-08-02 13:15:28.858805
246	images	Post	12	246	2020-08-02 13:15:28.863208
247	images	Post	16	247	2020-08-04 09:19:50.693064
248	images	Post	16	248	2020-08-04 09:19:50.703413
249	images	Post	16	249	2020-08-04 09:19:50.710792
250	images	Post	16	250	2020-08-04 09:19:50.721885
251	images	Post	18	251	2020-08-04 10:03:37.095491
252	images	Post	19	252	2020-08-04 10:04:01.671292
253	images	Post	19	253	2020-08-04 10:04:01.677741
254	images	Post	19	254	2020-08-04 10:04:01.684593
255	images	Post	19	255	2020-08-04 10:04:01.689435
256	images	Post	20	256	2020-08-04 10:05:00.98076
257	images	Post	20	257	2020-08-04 10:05:00.98839
258	images	Post	20	258	2020-08-04 10:05:00.993008
259	images	Post	20	259	2020-08-04 10:05:01.000146
260	images	Post	21	260	2020-08-04 10:08:27.002916
261	images	Post	21	261	2020-08-04 10:08:27.009648
262	images	Post	21	262	2020-08-04 10:08:27.014517
263	images	Post	23	263	2020-08-04 10:13:16.471256
264	images	Post	23	264	2020-08-04 10:13:16.479941
265	images	Post	23	265	2020-08-04 10:13:16.486434
266	images	Post	27	266	2020-08-04 10:15:17.372376
267	images	Post	28	267	2020-08-04 10:15:41.496028
268	images	Post	50	268	2020-08-04 10:35:07.104685
269	images	Post	50	269	2020-08-04 10:35:07.110976
270	images	Post	50	270	2020-08-04 10:35:07.115992
271	images	Post	51	271	2020-08-04 10:36:44.448857
272	images	Post	51	272	2020-08-04 10:36:44.456079
273	images	Post	51	273	2020-08-04 10:36:44.460862
274	images	Post	52	274	2020-08-04 10:38:43.279117
275	images	Post	52	275	2020-08-04 10:38:43.284988
276	images	Post	52	276	2020-08-04 10:38:43.293563
277	images	Post	52	277	2020-08-04 10:38:43.298836
278	images	Post	53	278	2020-08-04 10:39:03.578687
279	images	Post	53	279	2020-08-04 10:39:03.585387
280	images	Post	53	280	2020-08-04 10:39:03.594507
281	images	Post	53	281	2020-08-04 10:39:03.599276
307	images	Post	87	307	2020-08-04 14:29:43.122352
308	images	Post	87	308	2020-08-04 14:29:43.140086
309	images	Post	89	309	2020-08-04 14:37:25.264325
310	images	Post	89	310	2020-08-04 14:37:25.276826
311	images	Post	89	311	2020-08-04 14:37:25.28188
312	images	Post	90	312	2020-08-04 14:38:35.982458
313	images	Post	91	313	2020-08-04 14:39:03.824843
314	images	Post	92	314	2020-08-04 14:40:22.510986
315	images	Post	93	315	2020-08-04 14:41:36.032948
316	main_photo	Product	162	316	2020-08-05 11:25:10.810472
317	files	Attribute	286	317	2020-08-05 11:25:11.130294
318	files	Attribute	286	318	2020-08-05 11:25:11.135057
319	files	Attribute	286	319	2020-08-05 11:25:11.140555
320	files	Attribute	253	320	2020-08-05 11:37:07.496823
322	main_photo	Product	163	322	2020-08-05 11:41:15.464315
323	files	Attribute	291	323	2020-08-05 11:42:10.641475
324	files	Attribute	291	324	2020-08-05 11:42:10.678873
325	files	Attribute	291	325	2020-08-05 11:42:10.733109
326	main_photo	Product	164	326	2020-08-06 11:42:16.135318
327	files	Attribute	295	327	2020-08-06 11:42:16.501019
328	files	Attribute	295	328	2020-08-06 11:42:16.506552
329	files	Attribute	295	329	2020-08-06 11:42:16.51175
330	files	Attribute	295	330	2020-08-06 11:42:16.517904
331	main_photo	Product	165	331	2020-08-06 11:55:02.139764
335	main_photo	Product	166	335	2020-08-10 09:55:00.569441
336	files	Attribute	303	336	2020-08-10 09:55:00.938042
337	files	Attribute	303	337	2020-08-10 09:55:00.948822
338	files	Attribute	303	338	2020-08-10 09:55:00.954574
341	main_photo	Product	167	341	2020-08-11 16:13:40.745888
342	files	Attribute	308	342	2020-08-11 16:13:41.22235
343	files	Attribute	308	343	2020-08-11 16:13:41.227805
344	files	Attribute	308	344	2020-08-11 16:13:41.237684
346	files	Attribute	298	346	2020-08-11 16:15:27.562494
347	files	Attribute	298	347	2020-08-11 16:15:27.598146
348	files	Attribute	298	348	2020-08-11 16:15:27.65263
349	main_photo	Product	168	349	2020-08-11 16:18:30.131874
350	files	Attribute	314	350	2020-08-11 16:18:30.204611
351	files	Attribute	314	351	2020-08-11 16:18:30.209471
352	files	Attribute	314	352	2020-08-11 16:18:30.213926
354	files	Attribute	319	354	2020-08-11 16:20:35.944276
355	files	Attribute	319	355	2020-08-11 16:20:35.948902
356	files	Attribute	319	356	2020-08-11 16:20:35.958507
357	images	Post	94	357	2020-08-11 16:40:57.804409
359	images	Post	95	359	2020-08-13 12:23:37.918661
361	files	Attribute	329	361	2020-08-23 09:23:48.41743
362	files	Attribute	329	362	2020-08-23 09:23:48.422302
364	files	Attribute	333	364	2020-08-23 09:28:27.212069
366	files	Attribute	336	366	2020-08-24 14:57:37.587629
367	files	Attribute	336	367	2020-08-24 14:57:37.593044
368	files	Attribute	336	368	2020-08-24 14:57:37.603498
375	files	Attribute	364	375	2020-08-25 13:06:59.800944
451	files	Attribute	414	413	2020-08-28 16:25:40.400164
452	files	Attribute	414	414	2020-08-28 16:25:40.405031
453	files	Attribute	414	415	2020-08-28 16:25:40.413345
464	files	Attribute	417	418	2020-09-14 12:25:53.829856
467	files	Attribute	421	420	2020-09-15 13:09:23.920692
468	files	Attribute	421	421	2020-09-15 13:09:23.929722
469	files	Attribute	421	422	2020-09-15 13:09:23.938481
477	files	Attribute	424	430	2020-09-20 08:44:33.956587
478	files	Attribute	424	431	2020-09-20 08:44:33.961625
480	main_photo	OrderedProduct	50	419	2020-09-20 08:44:47.227236
481	main_photo	OrderedProduct	51	429	2020-09-20 08:44:47.269639
482	main_photo	OrderedProduct	52	429	2020-09-20 09:22:08.883181
483	main_photo	OrderedProduct	53	429	2020-09-20 09:37:50.617519
485	files	Attribute	428	433	2020-09-20 09:46:39.930219
486	files	Attribute	428	434	2020-09-20 09:46:39.939548
487	files	Attribute	428	435	2020-09-20 09:46:39.94617
490	main_photo	OrderedProduct	56	429	2020-09-20 09:47:14.161971
498	files	Attribute	431	442	2020-09-27 15:42:44.153517
499	files	Attribute	431	443	2020-09-27 15:42:44.161024
500	files	Attribute	431	444	2020-09-27 15:42:44.168663
501	main_photo	OrderedProduct	58	429	2020-09-27 15:43:54.241875
502	main_photo	OrderedProduct	59	441	2020-09-27 15:43:54.254516
503	main_photo	OrderedProduct	60	419	2020-09-27 15:43:54.306135
505	main_photo	OrderedProduct	62	441	2020-09-28 16:03:28.977904
507	main_photo	OrderedProduct	64	419	2020-09-28 16:12:44.636385
544	files	Attribute	438	449	2020-09-29 12:24:13.031961
546	files	Attribute	443	451	2020-10-02 12:46:06.116845
547	files	Attribute	443	452	2020-10-02 12:46:06.125654
548	files	Attribute	443	453	2020-10-02 12:46:06.145322
549	main_photo	OrderedProduct	97	441	2020-10-02 12:46:15.325031
550	main_photo	OrderedProduct	98	450	2020-10-02 12:46:15.374115
551	main_photo	OrderedProduct	99	441	2020-10-02 12:50:56.246263
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
1	avwnbp3jxqc4uf4d399b5a7f9eur	site.png	image/png	{"identified":true,"analyzed":true}	111349	bsMxZbZMTZjKaqHXYbxgBA==	2020-07-20 10:10:07.576438
3	yv7mqtxnd7fldz8u5qa1cjj7l1f0	site.png	image/png	{"identified":true,"analyzed":true}	111349	bsMxZbZMTZjKaqHXYbxgBA==	2020-07-20 10:13:58.457844
58	02jxnty1gexbthkot82an2nvw4gr	site.png	image/png	{"identified":true,"analyzed":true}	111349	bsMxZbZMTZjKaqHXYbxgBA==	2020-07-24 10:26:32.108461
59	qlcbs5f8hvzuqaajptb5rpqibprx	structure.png	image/png	{"identified":true,"analyzed":true}	25890	5ZIFK5fYd3s0K5Yc/7kc3w==	2020-07-24 10:26:32.471146
60	rsf9glkujks3725l45k095av2oll	site.png	image/png	{"identified":true,"analyzed":true}	111349	bsMxZbZMTZjKaqHXYbxgBA==	2020-07-24 10:28:10.499479
61	cs1gqmsewpibq3op2wggg7gzvsx8	icon.png	image/png	{"identified":true,"analyzed":true}	14798	jgUAmFOVhiZypWVw0GADZA==	2020-07-24 10:50:58.592124
62	qgnzlhehuu45h5hlyt7wbfnhpalp	structure.png	image/png	{"identified":true,"analyzed":true}	25890	5ZIFK5fYd3s0K5Yc/7kc3w==	2020-07-24 10:50:58.655968
19	5fdqffraebm2oqv2ir319wfyc438	site.png	image/png	{"identified":true,"analyzed":true}	111349	bsMxZbZMTZjKaqHXYbxgBA==	2020-07-21 14:48:14.334536
20	j8aeyekg9h6zhfh79vkj5skbvxn8	Безымянный.png	image/png	{"identified":true,"analyzed":true}	9881	C3RGW0kgAXO9b8zD4KhKZQ==	2020-07-21 14:48:14.437475
21	8fmk2c0kvvcrqozz8468w10inul2	site.png	image/png	{"identified":true,"analyzed":true}	111349	bsMxZbZMTZjKaqHXYbxgBA==	2020-07-21 15:31:33.978725
22	8depusf8u2vwszwb3k4xq4jlzz3b	structure.png	image/png	{"identified":true,"analyzed":true}	25890	5ZIFK5fYd3s0K5Yc/7kc3w==	2020-07-21 15:31:34.105505
23	1i7gjzsudki5dmj9pc0gelp7vocl	site.png	image/png	{"identified":true,"analyzed":true}	111349	bsMxZbZMTZjKaqHXYbxgBA==	2020-07-21 15:32:36.963502
24	tt5c9dnlsr1fjd4ahut3cpxpwun4	site.png	image/png	{"identified":true,"analyzed":true}	111349	bsMxZbZMTZjKaqHXYbxgBA==	2020-07-21 15:32:37.011998
25	grjvtdah7a02yj2b4ss0kaghp95r	structure.png	image/png	{"identified":true,"analyzed":true}	25890	5ZIFK5fYd3s0K5Yc/7kc3w==	2020-07-21 16:59:35.649343
63	oomm84u2r5x0cn1nq7igtnktcli4	icon.png	image/png	{"identified":true,"analyzed":true}	14798	jgUAmFOVhiZypWVw0GADZA==	2020-07-24 10:53:30.713745
64	b0o280k896pov7z5f8ubmogfxbf9	structure.png	image/png	{"identified":true,"analyzed":true}	25890	5ZIFK5fYd3s0K5Yc/7kc3w==	2020-07-24 10:53:30.762239
65	hqsioyy9q5gdp0pm0edtc6ckqxmp	icon.png	image/png	{"identified":true,"analyzed":true}	14798	jgUAmFOVhiZypWVw0GADZA==	2020-07-24 10:57:26.917995
66	i65c893sbxnf5bb5i276lf1tuid6	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:03:52.381913
67	flcvcqzl1oco23pb7kyf22mtc6b9	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:05:21.674296
68	at157orxi3l0gcowgrqyzftnj9ca	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:05:23.674516
69	8d1pyvb1j85p7vzpu5heynyws9wg	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:05:24.52851
70	eety6axoo8sr270uv2c49gg7enym	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:05:25.202395
71	ylgbyrqon9f838ye8q6plpcozbyn	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:05:25.721465
72	ugeipgxk3u7bd9ple1j6mlowt6z5	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:05:26.945784
73	ss84bpws3d7vecgjasijnyobq0iw	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:07:19.998005
74	0f71id7s2ravnboi8ojug2yfencs	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:08:25.515686
75	40pjuaa83je7bkrrqbwu0pkz6pcw	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:08:54.197523
76	vfu20o3vf1fj96d13yxy1c6c5kmv	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:04.370217
77	nt1fa0w6vrpa71amzrj88plrjfm0	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:05.587728
78	9s7b7h5xe98vn6rz2ah48soy8phu	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:08.684321
79	foil4kftkgbcq6vmj8mwit193b8m	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:09.982824
80	s2sa21nos6uxh5bsmh8t3f3kbwyn	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:10.48125
81	7cluf9m5tothwdby6ddli730943v	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:10.888005
82	5jxltlu0sevnv98thmobh9tqtdt2	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:11.225689
83	sii4a8vnaismmwotl3fip82ule2d	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:11.551682
84	fuf85v0y3bf9ja6rqvdmswv26sch	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:11.866285
85	ocbmdh11dkld87c1ygqqtuzx8dto	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:12.114168
86	wy21avr0m2vxpcwkh48viqryat2p	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:12.45356
87	66145x8ezcs61gfkxw8926mszdio	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:12.768404
88	ohjnro14r1x4jorg5thrnnay8wvd	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:37.010717
89	gq1r6u9z51woyjhayuj11qcxn6zn	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:09:53.68033
90	jthc40q7tlbjynfkp8kq1hzmvbf9	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:10:10.207524
91	zxi96v7dsmv0dkdw71ztqlfdpq7s	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:13:35.58451
92	6wzus016qilna4rrm2jxa4n45y9u	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:13:35.672329
93	86r6ihjht61fmcsdov8gmvq4grhs	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 11:13:35.679847
94	9wpevda44jmqdntb1akysxr1yath	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-24 11:13:35.685216
95	0k2b2yntd34zpjdocvw25b66xmy2	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:52:14.234942
96	ns784ud6fuyy7xrnvah8z3okzhlv	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 11:54:04.053294
97	kbj70pbsnut6c5cdc0o4zk4d24xy	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 11:55:31.41682
98	w5q6lwfm51s1a1pvqnv7ms45to5y	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 11:55:31.531376
99	ipr3m1pxqv5bictnja23jf3v5blg	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 11:55:31.539443
100	ft9mdusgqsa1jwnyzby4q9ibvqgb	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-24 11:55:31.544345
101	ctysk71pnoekht927iuhm7whytbf	Screenshot_533.png	image/png	{"identified":true,"analyzed":true}	234178	uxP+BfxrWTxlWkgMD0rRYA==	2020-07-24 11:55:31.548816
102	dpxh30ly3yjxp9ajpm1uhppednj3	gettyimages-478156278.jpg__1510843496__72564__vid304671e.jpg	image/jpeg	{"identified":true,"analyzed":true}	289095	JJ/VMXLeqv635mWWZym8tw==	2020-07-24 11:55:31.555178
104	khcjfug8oa7d8z56r0cu0x5rwn2e	№1.jpg	image/jpeg	{"identified":true,"analyzed":true}	347608	qVDtwd+BnzDpvIurLukNhA==	2020-07-24 11:55:31.566962
103	bf7j5yljtg8c0vwwwpzjhritsq0u	1ea365d5e8ac6730ed6e0af418860ebfba74e3ca.jpg	image/jpeg	{"identified":true,"analyzed":true}	51779	u2WbVPo/SQ8f5OBBnRJJdw==	2020-07-24 11:55:31.56027
105	8dvigfpkolmzp8m3utaxawltmrcs	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 12:58:09.205622
106	tj9wsnnstgyx300hfzjs0r4kzpqd	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 12:58:09.309543
107	xw6bx7hsnl8djif7gsxu6wto3dji	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 12:58:09.316573
108	ojlhx0uumzj6i69c9q3hvtevgsrs	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 12:59:01.969943
110	r1yrsb7nnk0ymtgxgpg598u81iai	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 12:59:02.062105
109	6tgyl8reld5i6dn5jlciikubz6w4	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 12:59:02.052922
111	w7p4blzkc0iofeb1zii8hus5rvw1	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 12:59:38.29279
112	s2b0uh4bjmv7st9x8xumie5aqpwn	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 12:59:38.350626
113	rhgssa2icoa7xxo142gr13221h5b	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-24 13:01:13.586536
114	l38luzeam633evwk1jcarbwemt6h	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-24 13:01:32.913539
115	615k9zn1vvj9jebtr2a5drrd5r5p	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-24 13:01:42.413462
116	jcxj6m6fz0fhmm5cp9p2sbvmsgt1	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 13:01:42.46998
117	0jyl3ie6ro62a0h55z8ext2ipbs6	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 13:04:26.582848
118	uc38a3b267wd8bp3sxrhv98e3ftc	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 13:04:37.523434
119	f8wa0zp7q23rkolzglpj2u0o0l2a	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 13:04:37.615775
120	ig9fpnbenmbmbn8wlbel3lc5ac6w	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-24 13:08:25.327835
121	coku4jdxbjbp0vcepoba2389t1rq	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 13:08:25.42252
122	6bys6brnjjdloqdhlu86lxe7ps6l	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 13:08:25.431576
123	mfse36rh777g9xwbsmwq4fz1orj4	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-24 13:08:25.436997
126	4moen7isq4lpxa7ygccu7amzrm18	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 13:10:03.954693
124	x4tqcg8g39iv0gnwq3dlql47n720	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-24 13:10:03.866699
127	hu4z5g722ezxkwc3twux928vhfc4	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-24 13:10:03.959431
125	bboxylhnvh82u4cpq5qpyxpgl9hy	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-24 13:10:03.946635
128	hft3v1djsooqiu0ig8jx2el3lgmg	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-24 13:11:38.869917
129	iw35ocd6vkl6uhw6uet337hblco4	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 13:12:58.948431
130	1nhaudnss1ct29506pifpwnsyz4w	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 13:14:34.247699
131	dngq5gbf4gngbwietqmjpvuvixfm	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-24 13:14:34.308597
132	7caeif7ad6v0co757nscrqj4zf5b	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 13:14:46.714088
133	5a8ucyuby6nr7xv9aairmonztz9r	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-24 13:14:46.78034
134	lgnvimc29qyhykt4c6353i2mhxoj	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-24 13:14:54.442608
135	yqe3736q7hyao6ixq1vc4g3pf34l	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-25 09:04:27.985529
136	ue5tn4wz6mbh0gmgm7zyec4tcsbl	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-25 09:04:28.144453
137	ewmsm0t10u0jbmw1gbab7hfu05y1	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-25 09:04:28.152211
138	7nb7jibqiqih7kysykyke2m4i8dm	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-25 09:04:28.156733
139	6blks3biku0hbep19c606da12ce5	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-25 09:42:29.050126
140	fm4cc146jrwelhq0qgb2tk958oof	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-25 09:42:29.120005
141	e0qih4ebc71o682p95nugju7qa3t	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-25 09:46:58.319916
142	do219dvg71piat2mvji6c38yz7lw	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-25 09:46:58.597087
143	lc73v3wyoyomlgop6ca0e8ilz6sb	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-25 09:46:58.606443
144	a3sxwp0cw4b46j1k8qsn6cc3s6t1	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-25 09:46:58.61324
145	q6bsqb0f88vl4sslauligov1qcb4	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-25 09:52:16.059324
146	d3wahmxjr0xqeitd3qasijfkoe2s	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-25 09:52:45.855127
147	d6746t66uqk7zsek3rubvp0d946t	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-25 09:53:03.13542
148	207ptf3kkdyf9qm3an2g44z2xpbf	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-25 09:58:10.145294
149	eaqo81f9t14d66pfm4ctgr4uc52w	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-26 09:59:43.240424
150	h04hsebcglqk3id0eh8s2w3r6z16	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-26 09:59:43.795096
151	ufsem22xdk2ti38mn6sc6fayepfh	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-26 10:18:36.194603
152	w6gpk8nyhcd8n82asdnq1tnrikvd	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-26 10:30:05.734788
153	s47nntbf927pave3ro6bdbw32296	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-26 10:30:05.797162
154	apmx41ehd49czg5l1zp7jza34xdz	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-27 07:15:50.551003
155	xypn3hm73nbpdopstm2fw5bcvxoz	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-27 07:18:23.466723
156	rji3bccerz9vz5x6m1t1uprdcbs4	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-27 07:18:25.012145
157	39ldfwu4glk9qyavx14xro9lcnl8	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-27 07:18:25.020074
158	3a1n89fxeela2pfsd4n9sysoqibm	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-27 07:18:25.028968
159	s9lydrxoxwrsyba29vrlaeezuo9z	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-27 07:21:31.216575
160	6y5s7nnkxagzuqekzg2uyrydb6jn	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-27 07:21:31.292231
161	dg5pqm51sqv35x0819pq99uizi30	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-27 07:21:31.301468
162	3sdc637uyl5j54i6thfvpzlyx46x	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-27 07:21:31.307247
163	9o6f5ym1wz7jwn7fybp34warpjze	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-27 15:55:49.463203
164	60lhfwunflk0zonpxho9lg7xy29w	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-27 15:55:49.902604
165	wsepk9pnssgsy5lxnumfwykyfigy	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-27 16:00:41.987556
166	wafg2spdv870uf6ffg1a762w3mbr	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-27 16:14:19.441425
168	y3uko6p3rk0vcx3jo2nz8vm15nbs	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-27 16:14:19.557976
169	49cusltn6bro4d4y7fhb29wra5cs	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-27 16:14:19.565787
167	1k3vz522twjo1l05eoy3evbwn3d0	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-27 16:14:19.552711
170	fiv5ooxgf7bmpcwnp6ijclod531z	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-28 10:05:50.284826
171	shjxzas4defj6xlgkvp46o9qeesh	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-28 10:07:32.481852
174	n1apyszaokf429t82rhbga1ajk6s	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-28 10:07:32.601245
173	q73n5zawsyoql01jxrv9zteqxlk0	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-28 10:07:32.593498
172	6eu3edzm6alwfs8ikglp6xu0nyc0	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-28 10:07:32.588209
175	1nrlvsxfo26jmk3i9kw9de5sbgww	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-28 11:34:17.597803
176	e5dfzwshogo7uwu32oe9hvkxn07c	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-28 12:08:54.614805
177	1z8xhttl3uclvx30hyws979im7bt	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-28 12:13:02.749745
178	whe3xr8fjok58nv20yguef1o142q	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-29 10:37:54.278711
179	p2f3enitd7s06n4k9pprcrtvmiiy	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-29 10:37:54.723409
180	0cqqta5sx0tgarhq8mvnsypd0vyc	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-29 10:37:54.742366
181	olrnzkfp6dd1go5suosyw5x2q6hs	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-29 10:37:54.75255
182	mtq8vzuk4c15wnjiprfcx06yiyan	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-29 10:53:59.046352
183	ma2uiu6wlcbum6ddqhtopjkjs1os	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-29 10:53:59.134884
184	62mazrtzip0xene7ejp566w5jn9l	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-29 10:53:59.140743
185	kjjd6t8kq2u8gvdklhfc54xbdowl	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-29 10:53:59.146002
186	2nf0zxau3hj4bs3i464izlsj7uha	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-29 11:11:15.56301
188	epwxx2tvgc0aq4wghndzizc8s2sw	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-07-30 08:11:07.719166
189	1jvnai49nh3cm3kp5ebjy364w7cw	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-07-30 08:11:07.724516
190	bbvv6lc5w9acocurv1ww6gpiqrnt	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-07-30 08:11:07.733902
191	6i31vmudcjx6egr3vgdk12nlk5ko	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-01 15:34:37.713137
192	fl1i2n960qethmyziah9z3pkce16	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-01 15:34:37.748026
193	scykvxsixx1grde5pf21noaj298f	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-01 15:34:37.753098
194	cumnlfnhzdzfv0aewe22v0f1n2pd	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-01 15:34:59.217809
195	5heg74nlldfbah6yv1to5dkjuxn5	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-01 15:34:59.225683
196	skdqqlosz1py8gwap5bk6bhqlg2m	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-01 15:34:59.233114
197	pt28aicjbi8zgciksacwoakp2347	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-01 15:37:29.309104
198	3241dfxg1wcftqciumly4fe0ry0n	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-01 15:37:29.317335
199	hhmb8dpatvhs1s0t7j89n4zq02br	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-01 15:37:29.327631
200	8iajfzasfsai1vzq5otpz80sf3p4	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-01 15:37:55.796078
201	ysa9qqe25onp4zu2uuuvfgrqf7u2	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-01 15:37:55.802026
202	j74i01bvn48ecnhqxnuun4q15aag	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-01 15:37:55.807277
203	pvgtqvk2jozzzg2iz89ngoydqt0f	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-01 15:39:10.810547
204	5s827tajn6fd0p0msz1fd6hmj86b	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-01 15:39:43.673042
206	brcrj3rnotnd48gtqycy0o69pzhn	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-01 15:39:43.687582
205	a17ui9jgzwvdqjmremzdskn9haws	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-01 15:39:43.681573
207	uhawuvk976khnkaurzi558vrchfx	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-01 15:39:59.223418
210	t3h91rk80280x9d7ez134cfj1l37	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-01 16:10:24.292596
208	ux7560r67gc2skx5akn7tl031ss1	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-01 16:10:24.27984
209	e3ii1aswg4wavwwtqqyomx395rfo	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-01 16:10:24.287636
211	0pbhflt3r51bvcb4263jqmns7tlg	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-01 16:48:56.814685
352	6v0o5elnlr9sf8a8pdiv2fiiotri	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-11 16:18:30.211686
244	6c9et3kbrspuulfrxmioze4yn0q6	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-02 13:15:28.840251
246	7fdha649yuaoj1s8gfo6eel253pl	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-02 13:15:28.861131
245	owc6typqko4qx51svos5c9bkxeeb	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-02 13:15:28.856484
248	b6sqq005eawymucv2ymial7ozp1w	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-04 09:19:50.698836
247	q0693f00dgvjh68ojkiwxtubpkoe	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 09:19:50.689574
250	eq9hgtauatmz164irj7xvg6ulcmj	Screenshot_533.png	image/png	{"identified":true,"analyzed":true}	234178	uxP+BfxrWTxlWkgMD0rRYA==	2020-08-04 09:19:50.718795
249	l5ff2juyd4yno1ghu2dovj0huqvt	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-04 09:19:50.707586
251	5q0k3zdzssvrzah5ffem633tf2cm	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 10:03:37.092466
252	xxjytsc6k5ner7m6vafdhud9vp2r	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 10:04:01.668224
255	3tkf5zrizgfvrx2ovkgfyvdvlh92	Screenshot_533.png	image/png	{"identified":true,"analyzed":true}	234178	uxP+BfxrWTxlWkgMD0rRYA==	2020-08-04 10:04:01.687221
253	pm7ox84arrr97vme7ve27edj3538	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-04 10:04:01.675515
254	tqokcvc0oy0wq4igj6tz8pdxio2j	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-04 10:04:01.680454
256	w7qmqdtcdl8x243w385jp1t2ch7d	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 10:05:00.978051
259	lo1f5gigm2wwrefez4m9r7lpdm2u	Screenshot_533.png	image/png	{"identified":true,"analyzed":true}	234178	uxP+BfxrWTxlWkgMD0rRYA==	2020-08-04 10:05:00.996294
257	o2nwhts64o0lgtr9s59w5xscpiga	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-04 10:05:00.98586
258	iptt1gg8ug1uh1w2vzed72vxz9af	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-04 10:05:00.990727
261	vb0xp5kohndxszhm60mpxbcpt8tb	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-04 10:08:27.007079
262	ltrizos9prgmjix4kx04afhso259	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-04 10:08:27.012106
260	2xzqyyzftckv1zjta92swgba6llx	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 10:08:26.99951
263	doksy7r1fu73xv0zpzcvyhh8nesy	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 10:13:16.468133
264	88oliubojzvep5d1ww6sw72tnx09	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-04 10:13:16.475574
265	sbkw9q80owasd1ltlj1jjxc8w7ej	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-04 10:13:16.482543
266	tidebvjbk3wrf8k9sz9wu6tjg80b	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 10:15:17.367453
267	il6b81ke0detq3tpcg1um8jskb2r	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 10:15:41.493666
268	b1pq75x3p4z0ti1wyrxmz0qzgv4o	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 10:35:07.101331
269	kkoj0uvao443x120tdvw2n8xcoik	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-04 10:35:07.108602
270	tc2na2o3nrqcznqesddt3wjm4j3j	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-04 10:35:07.113384
271	ac2yaltocja1tnlfavde8c0f0whn	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 10:36:44.446485
272	c84wabl8gox5somkrs7dqzazbkp6	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-04 10:36:44.452803
273	p5hz94p0co41buu4xlhhkpcrdthi	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-04 10:36:44.45867
277	n7jf9r4e07rqy61haamyhx4zwps5	Screenshot_533.png	image/png	{"identified":true,"analyzed":true}	234178	uxP+BfxrWTxlWkgMD0rRYA==	2020-08-04 10:38:43.296311
275	8bfsoep1pu7dh2fa2mzydbiais60	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-04 10:38:43.282075
276	rtqlfv24daaxt4wvv3nba4vbgyu0	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-04 10:38:43.289243
280	m0atf27d4wblf1588jovgb0hy0j0	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-04 10:39:03.592029
355	2q6l4vjsp9morwizrylgnsuhr60j	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-11 16:20:35.946799
356	4l1vud72uvqx4744lm4u51o435m5	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-11 16:20:35.951497
274	e9p6u1ly3v11rtj81y97q8pogjtb	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 10:38:43.276398
278	k4ur47xhstj4ckhwlw59n40ycr8c	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 10:39:03.57627
279	0ixsex9ygi2nyq5ui8dt955motsu	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-04 10:39:03.582583
281	t63svrmo9bhqehmq6lrls31kxumg	Screenshot_533.png	image/png	{"identified":true,"analyzed":true}	234178	uxP+BfxrWTxlWkgMD0rRYA==	2020-08-04 10:39:03.596954
307	headg8chclug90wyekwqbmlcbyg2	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 14:29:43.110825
308	4qinttzcbebo6eaokevy1jf8s356	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-04 14:29:43.135975
309	d0kd9v98re84jet3gzfp9393rsx0	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 14:37:25.255221
310	ltul7rsiwdnrztopkyztt4w697ek	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-04 14:37:25.274446
311	391hj97qa4jt9xyybjy5u06lt7h7	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-04 14:37:25.279439
312	sfqfakxsc33th1hzrelef78edx7w	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 14:38:35.979959
313	z4vs66itirurch2gs4cyrmado915	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 14:39:03.822368
314	g1c6qku2xal7jbcav7atzdq5zwbu	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 14:40:22.505353
315	mzuoos7pttmr15ojmdy75pqon3fa	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-04 14:41:36.027471
318	tnj0z602c0n8qr1tz5vhprj127ct	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-05 11:25:11.132913
317	srw29bu80zihefmewguzxyipz05n	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-05 11:25:11.125282
319	nva4chfcjcabwb63a2iuy5n4a6fl	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-05 11:25:11.137657
316	y4efnwn25rjxt5ffjifeszwa05ak	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-05 11:25:10.806663
320	u2spv5ohxkpyx9ke4wkf9oed98yd	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-05 11:37:07.493907
322	9ctqici6jw45pijez9fp1ta2bztd	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-05 11:41:15.462034
323	71dw4zah531halugfrgu8mzf0rn1	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-05 11:42:10.636669
324	etxzqh89iv6yp0ot2ph1w7jb6ema	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-05 11:42:10.673645
325	dw1aptxpi6vfnd1hpfaaj0yz6llj	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-05 11:42:10.725541
326	feann560sm7r0yr5tni8uldj42nv	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-06 11:42:16.131153
327	ifaz88wjp7we0obgre7bopghsp52	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-06 11:42:16.495961
328	vpetqnvy45vjrfzdqvmujcex7lop	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-06 11:42:16.504114
329	uia78zeb32dzvhvo79q64kll0n61	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-06 11:42:16.509014
330	o0vkqcwjo0cyvee8u4euxl4d0pl6	Screenshot_533.png	image/png	{"identified":true,"analyzed":true}	234178	uxP+BfxrWTxlWkgMD0rRYA==	2020-08-06 11:42:16.515394
331	wi9cagnwcw6f6uvdgka4hxepr6i8	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-06 11:55:02.136523
335	cuoumebsvnx0hqktgx24j2j7brl6	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-10 09:55:00.566621
336	na22uu2uaadjlbeewyl771gsorm7	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-10 09:55:00.934789
337	r9pw4kmwb7nrojxwqfcsnk93bjpb	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-10 09:55:00.946053
338	iurob12cdx5wtskm0jwe8igxhfm3	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-10 09:55:00.951784
341	ddzug6g9zauvqpq9n7oo2dp5178q	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-11 16:13:40.723706
342	dfkotdadhnnv7sqjajocbog8a3ls	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-11 16:13:41.219419
343	gi4ibcvhvms0hg1evfsyo08plqg8	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-11 16:13:41.225158
344	15x8qkcekx64khxfgiae0uru4mg9	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-11 16:13:41.235106
346	6m7vy1v1nqwy4hd3jrsbjvo2qdzj	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-11 16:15:27.559756
347	vni1t9dhc4lujdeti2xpunpgb6le	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-11 16:15:27.592215
348	627ot1e791e76pvmss2xkq7w5bdy	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-11 16:15:27.637657
349	75lreqf4jp9tv6vnb4aj638hk7eo	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-11 16:18:30.129268
350	8le7uinsw3nnu0ylq7g7kn0hauzw	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-11 16:18:30.201514
351	cxiri7b6wsi8uzvoo0ba3507cwnc	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-11 16:18:30.207257
354	g7t3903o1dgbd6jaxafkm9fk1h0q	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-11 16:20:35.941208
357	o74iziaypdqu9wfccx1i7x0u1bhu	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-11 16:40:57.801726
421	h61dl8lu61ppbv62gcrfulb5qgky	Screenshot_533.png	image/png	{"identified":true,"analyzed":true}	234178	uxP+BfxrWTxlWkgMD0rRYA==	2020-09-15 13:09:23.925624
359	tll4dfpwrozxssqvy72r25on1ak1	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-13 12:23:37.914687
361	13cs1a9lqj9qxz8bjn4j8pwtm67o	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-23 09:23:48.414628
362	up1qchmmoc1of3t5rb1zfz9buor2	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-23 09:23:48.41992
430	nzrpdx5w81x0e0xy84ezk04tb7wx	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-09-20 08:44:33.954044
364	c8gdzbflbsqxz94woqyaolsyqqjp	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-23 09:28:27.208407
366	77u56q3z104bheen8vp85vhr3z0y	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-24 14:57:37.583598
367	07qdhfmk9kt2k26iytlcw62nrc03	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-24 14:57:37.590542
368	bp3vljwem4uykj56tl3af122qpqa	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-24 14:57:37.596037
431	5iammgowo5r68aoldi82z9ei58kk	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-09-20 08:44:33.95893
415	andxg3x060pi2wfr20iopgs7gqyu	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-08-28 16:25:40.408633
375	t3iu3y9i9yntpp0dagqg4q5447uv	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-25 13:06:59.797295
376	nuhj5w14p787gmkgmz2lulce8vr7	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-28 10:12:33.00662
449	ljynctjeqy20fzbal9qk5ys404ri	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-09-29 12:24:13.027132
413	bsige1snthhrrtgetqdri8v8w0gl	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-08-28 16:25:40.397101
414	v4n8x7mkl9jpckrdmw4vp8o1m7m6	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-08-28 16:25:40.402747
418	wjcw2j5xqvahisbsgmo6tvb5nxno	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-09-14 12:25:53.821044
419	zv8l5xsogy48gl7qn0eg572u4h71	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-09-15 13:09:23.48087
420	brye8i0bec3jswpmuu3xv0dzvm34	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-09-15 13:09:23.912503
422	djw3ie4qyhqrfae23svixmqxphsv	gettyimages-478156278.jpg__1510843496__72564__vid304671e.jpg	image/jpeg	{"identified":true,"analyzed":true}	289095	JJ/VMXLeqv635mWWZym8tw==	2020-09-15 13:09:23.934265
429	g9qlxz1xj03gehhiyyfyloefodmq	Lorem-Ipsum-alternatives.png	image/png	{"identified":true,"analyzed":true}	6543	Cydf61CAAkXTRDvLjBlqBg==	2020-09-20 08:44:33.815444
433	dus4yw279fft50601yi1m5czfsjl	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-09-20 09:46:39.927684
434	xxi00bsnz6xbq2h1dct3ohd1bz9b	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-09-20 09:46:39.935475
435	f8rq3dkdsr8ierqu490avvj8vf7w	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-09-20 09:46:39.943038
441	k5i3qsj0av3tcq3h8vet7hsnll9e	gettyimages-478156278.jpg__1510843496__72564__vid304671e.jpg	image/jpeg	{"identified":true,"analyzed":true}	289095	JJ/VMXLeqv635mWWZym8tw==	2020-09-27 15:42:43.743837
443	8pk2mq8u8rq2ryhoc7904zyj5g4w	1ea365d5e8ac6730ed6e0af418860ebfba74e3ca.jpg	image/jpeg	{"identified":true,"analyzed":true}	51779	u2WbVPo/SQ8f5OBBnRJJdw==	2020-09-27 15:42:44.156757
444	6miic8o3vq2r9rb3b99f4q18wako	Lorem-Ipsum-alternatives.png	image/png	{"identified":true,"analyzed":true}	6543	Cydf61CAAkXTRDvLjBlqBg==	2020-09-27 15:42:44.164138
442	tgtalb2e81kaktewtm9lc56q6k5v	gettyimages-478156278.jpg__1510843496__72564__vid304671e.jpg	image/jpeg	{"identified":true,"analyzed":true}	289095	JJ/VMXLeqv635mWWZym8tw==	2020-09-27 15:42:44.150481
450	i0f355clyau8batl1e16mgb4ntzw	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-10-02 12:46:05.715542
451	1hli9zin4c777hhwi7i45o0d32h0	115ed17e4fee20a9e69510dfe749eebb0c1865bd_520_347_c.jpg	image/jpeg	{"identified":true,"analyzed":true}	69302	nlbEw1asXLWCoyLCFHZDBQ==	2020-10-02 12:46:06.11154
452	81vtbiyv0xfdmr0dbiyk2d5n0ua3	week10_700.jpg	image/jpeg	{"identified":true,"analyzed":true}	217478	fDZicrMgE55e4xCDvjMaig==	2020-10-02 12:46:06.121327
453	7ac69qpco7a5x1fzceph77dib30m	7_5.jpg	image/jpeg	{"identified":true,"analyzed":true}	633449	0T1EDGud3WgfYIEohvfqjw==	2020-10-02 12:46:06.130679
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.addresses (id, city, street, state, country, zip, suburb, county, shop_id, created_at, updated_at, order_id) FROM stdin;
15	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:16:19.004374	2020-08-28 06:16:19.004374	\N
16	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:17:52.955887	2020-08-28 06:17:52.955887	\N
17	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:20:07.443354	2020-08-28 06:20:07.443354	\N
18	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:20:30.464895	2020-08-28 06:20:30.464895	\N
19	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:25:06.640078	2020-08-28 06:25:06.640078	\N
20	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:25:07.554935	2020-08-28 06:25:07.554935	\N
21	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:25:08.243686	2020-08-28 06:25:08.243686	\N
22	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:25:08.811797	2020-08-28 06:25:08.811797	\N
23	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:25:09.336472	2020-08-28 06:25:09.336472	\N
24	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:25:39.448984	2020-08-28 06:25:39.448984	\N
25	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:26:14.450801	2020-08-28 06:26:14.450801	\N
26	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:26:24.571187	2020-08-28 06:26:24.571187	\N
27	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-08-28 06:26:56.636767	2020-08-28 06:26:56.636767	\N
93								\N	2020-09-19 11:02:49.692424	2020-09-19 11:02:49.692424	\N
60	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-09-07 14:41:54.538823	2020-09-07 14:41:54.538823	\N
61	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-09-07 14:42:34.676669	2020-09-07 14:42:34.676669	\N
62	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-09-07 14:44:00.166059	2020-09-07 14:44:00.166059	\N
63	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-09-07 14:44:13.657766	2020-09-07 14:44:13.657766	\N
64	район Орехово-Борисово Северное	Большой проспект 40	Москва	Россия	115569	Орехово-Борисово Северное		\N	2020-09-07 14:45:42.550314	2020-09-07 14:45:42.550314	\N
65	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	112	2020-09-07 14:47:15.600569	2020-09-07 14:47:15.640489	\N
66								\N	2020-09-07 14:50:07.120774	2020-09-07 14:50:07.120774	\N
67								\N	2020-09-07 14:51:14.662345	2020-09-07 14:51:14.662345	\N
68								\N	2020-09-07 14:54:27.766621	2020-09-07 14:54:27.766621	\N
69								\N	2020-09-07 14:54:30.227008	2020-09-07 14:54:30.227008	\N
70								\N	2020-09-07 14:54:43.957703	2020-09-07 14:54:43.957703	\N
71								\N	2020-09-07 15:13:01.320405	2020-09-07 15:13:01.320405	\N
72								\N	2020-09-07 15:13:04.870506	2020-09-07 15:13:04.870506	\N
73								\N	2020-09-07 15:13:26.009167	2020-09-07 15:13:26.009167	\N
74	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-09-12 08:00:22.21302	2020-09-12 08:00:22.21302	\N
75	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	113	2020-09-12 08:01:37.848309	2020-09-12 08:01:37.909481	\N
76	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	114	2020-09-12 08:08:51.710545	2020-09-12 08:08:51.740541	\N
77	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	115	2020-09-12 08:11:14.005697	2020-09-12 08:11:14.018407	\N
78	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	116	2020-09-12 08:12:34.483496	2020-09-12 08:12:34.497629	\N
79	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-09-12 08:13:55.283861	2020-09-12 08:13:55.283861	\N
84	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	122	2020-09-12 08:17:28.715692	2020-09-12 08:17:28.755851	\N
80	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-09-12 08:14:39.694673	2020-09-12 08:14:39.694673	\N
81	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-09-12 08:14:41.024516	2020-09-12 08:14:41.024516	\N
85	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	123	2020-09-12 08:20:23.449488	2020-09-12 08:20:23.466941	\N
82	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-09-12 08:14:42.819991	2020-09-12 08:14:42.819991	\N
86								\N	2020-09-12 08:21:38.362036	2020-09-12 08:21:38.362036	\N
83	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-09-12 08:17:05.248487	2020-09-12 08:17:05.248487	\N
87								\N	2020-09-13 14:57:51.059201	2020-09-13 14:57:51.059201	\N
88								\N	2020-09-13 14:58:26.495129	2020-09-13 14:58:26.495129	\N
89	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-09-13 14:59:07.04389	2020-09-13 14:59:07.04389	\N
90	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	124	2020-09-13 15:04:52.006527	2020-09-13 15:04:52.029481	\N
91	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	128	2020-09-14 12:17:45.984395	2020-09-14 12:17:46.019375	\N
94	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	\N	2020-09-20 08:34:50.927624	2020-09-20 08:34:50.927624	\N
95	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	129	2020-09-20 08:35:08.371765	2020-09-20 08:35:08.391988	\N
146	Таганрог	Большой проспект 40	Ростовская область	Россия	347927	Собачеевка	городской округ Таганрог	126	2020-10-04 07:48:22.791233	2020-10-04 07:48:22.805881	\N
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-07-20 10:09:12.017051	2020-07-20 10:09:12.017051
\.


--
-- Data for Name: attributes; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.attributes (id, name, text, num, product_id, created_at, updated_at, "check", type_name, hint, code) FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.carts (id, product_id, user_id, quantity, uuid, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.categories (id, created_at, updated_at, name, data, ancestry, is_template) FROM stdin;
568	2020-10-15 14:37:31.977462	2020-10-15 14:37:31.977462	Продукты питания	\N	\N	f
569	2020-10-15 14:37:31.983088	2020-10-15 14:37:31.983088	Молочные продукты	\N	568	f
570	2020-10-15 14:37:31.987649	2020-10-15 14:37:31.987649	Хлебобулочные изделия	\N	568	f
561	2020-10-15 14:37:31.833407	2020-10-15 14:37:32.026056	Творожные изделия	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Срок годности","type":"Number","id":2,"min":0,"max":null,"hint":"Дней","is_int":true},{"name":"Вес","type":"Number","id":3,"min":0,"max":null,"hint":"г","is_int":true},{"name":"Жирность","type":"Number","id":4,"min":0,"max":null,"hint":"%","is_int":false},{"name":"С заменителем жира","type":"Bool","id":5,"min":null,"max":null,"hint":null}]	568/569	t
562	2020-10-15 14:37:31.862394	2020-10-15 14:37:32.04066	Кисломолочные продукты	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Срок годности","type":"Number","id":2,"min":0,"max":null,"hint":"Дней","is_int":true},{"name":"Объем","type":"Number","id":3,"min":0,"max":null,"hint":"мл","is_int":true},{"name":"Жирность","type":"Number","id":4,"min":0,"max":null,"hint":"%","is_int":false},{"name":"С заменителем жира","type":"Bool","id":5,"min":null,"max":null,"hint":null}]	568/569	t
563	2020-10-15 14:37:31.8846	2020-10-15 14:37:32.054908	Хлеб	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Срок годности","type":"Number","id":2,"min":0,"max":null,"hint":"Дней","is_int":true},{"name":"Вес","type":"Number","id":3,"min":0,"max":null,"hint":"г","is_int":true},{"name":"Состав","type":"LongText","id":4,"min":null,"max":null,"hint":null},{"name":"Нарезной","type":"Bool","id":5,"min":null,"max":null,"hint":null}]	568/570	t
564	2020-10-15 14:37:31.905287	2020-10-15 14:37:32.069435	Выпечка	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Срок годности","type":"Number","id":2,"min":0,"max":null,"hint":"Дней","is_int":true},{"name":"Вес","type":"Number","id":3,"min":0,"max":null,"hint":"г","is_int":true},{"name":"Состав","type":"LongText","id":4,"min":null,"max":null,"hint":null}]	568/570	t
566	2020-10-15 14:37:31.947941	2020-10-15 14:37:32.084348	Мясо	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Срок годности","type":"Number","id":2,"min":0,"max":null,"hint":"Дней","is_int":true},{"name":"Вес","type":"Number","id":3,"min":0,"max":null,"hint":"г","is_int":true},{"name":"Тип хранения","type":"Text","id":4,"min":null,"max":null,"hint":null}]	568	t
565	2020-10-15 14:37:31.924157	2020-10-15 14:37:32.101899	Рыба	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Срок годности","type":"Number","id":2,"min":0,"max":null,"hint":"Дней","is_int":true},{"name":"Вес","type":"Number","id":3,"min":0,"max":null,"hint":"г","is_int":true}]	568	t
567	2020-10-15 14:37:31.97271	2020-10-15 14:37:32.115282	Овощи	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Срок годности","type":"Number","id":2,"min":0,"max":null,"hint":"Дней","is_int":true},{"name":"Вес","type":"Number","id":3,"min":0,"max":null,"hint":"г","is_int":true},{"name":"Расфасовка","type":"Text","id":4,"min":null,"max":null,"hint":null},{"name":"Вид готовности","type":"Text","id":5,"min":null,"max":null,"hint":null}]	568	t
577	2020-10-15 14:37:32.236473	2020-10-15 14:37:32.236473	Одежда и обувь	\N	\N	f
578	2020-10-15 14:37:32.241651	2020-10-15 14:37:32.241651	Куртки	\N	577	f
571	2020-10-15 14:37:32.137591	2020-10-15 14:37:32.256905	Обувь	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Размер","type":"Number","id":2,"min":0,"max":null,"hint":null,"is_int":true},{"name":"Материал(внешний)","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Материал подошвы","type":"Text","id":4,"min":0,"max":null,"hint":null},{"name":"Материал(внутренний)","type":"Text","id":5,"min":0,"max":null,"hint":null},{"name":"Цвет","type":"Text","id":6,"min":0,"max":null,"hint":null}]	577	t
572	2020-10-15 14:37:32.157408	2020-10-15 14:37:32.271378	Джинсы	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Размер","type":"Number","id":2,"min":0,"max":null,"hint":null,"is_int":true},{"name":"Материал","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Цвет","type":"Text","id":4,"min":0,"max":null,"hint":null}]	577	t
573	2020-10-15 14:37:32.178469	2020-10-15 14:37:32.284871	Рубашки	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Размер","type":"Number","id":2,"min":0,"max":null,"hint":null,"is_int":true},{"name":"Материал","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Цвет","type":"Text","id":4,"min":0,"max":null,"hint":null},{"name":"Размер воротника","type":"Number","id":5,"min":0,"max":null,"hint":null,"is_int":true}]	577	t
574	2020-10-15 14:37:32.195111	2020-10-15 14:37:32.298807	Свитера	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Размер","type":"Number","id":2,"min":0,"max":null,"hint":null,"is_int":true},{"name":"Материал","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Цвет","type":"Text","id":4,"min":0,"max":null,"hint":null}]	577	t
575	2020-10-15 14:37:32.216103	2020-10-15 14:37:32.312062	Зимние куртки	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Размер","type":"Number","id":2,"min":0,"max":null,"hint":null,"is_int":true},{"name":"Материал","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Цвет","type":"Text","id":4,"min":0,"max":null,"hint":null},{"name":"Натуральный мех","type":"Bool","id":5,"min":null,"max":null,"hint":null}]	577/578	t
576	2020-10-15 14:37:32.232219	2020-10-15 14:37:32.324906	Осенние куртки	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Размер","type":"Number","id":2,"min":0,"max":null,"hint":null,"is_int":true},{"name":"Материал","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Цвет","type":"Text","id":4,"min":0,"max":null,"hint":null}]	577/578	t
596	2020-10-15 14:37:32.739262	2020-10-15 14:37:32.739262	Товары для дома	\N	\N	f
597	2020-10-15 14:37:32.744715	2020-10-15 14:37:32.744715	Бытовая техника	\N	596	f
598	2020-10-15 14:37:32.749416	2020-10-15 14:37:32.749416	Товары для кухни	\N	596	f
599	2020-10-15 14:37:32.754193	2020-10-15 14:37:32.754193	Посуда	\N	596/598	f
600	2020-10-15 14:37:32.760044	2020-10-15 14:37:32.760044	Интерьер	\N	596	f
601	2020-10-15 14:37:32.765662	2020-10-15 14:37:32.765662	Бытовая химия	\N	596	f
585	2020-10-15 14:37:32.548429	2020-10-15 14:37:32.780111	Миксеры	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Максимальная мощность","type":"Number","id":2,"min":0,"max":null,"hint":"ВТ","is_int":true},{"name":"Планетарное вращение насадок","type":"Bool","id":3,"min":null,"max":null,"hint":null},{"name":"Крюки для замешивания теста","type":"Bool","id":4,"min":0,"max":null,"hint":null},{"name":"Объем чаши","type":"Number","id":5,"min":0,"max":null,"hint":"Л","is_int":false},{"name":"Материал корпуса","type":"Text","id":6,"min":0,"max":null,"hint":null},{"name":"Насадка-блендер","type":"Bool","id":7,"min":null,"max":null,"hint":null}]	596/597	t
592	2020-10-15 14:37:32.687769	2020-10-15 14:37:32.902327	Вазы	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Размер","type":"Number","id":2,"min":0,"max":null,"hint":null,"is_int":true},{"name":"Материал","type":"Text","id":3,"min":0,"max":null,"hint":null}]	596/600	t
593	2020-10-15 14:37:32.702983	2020-10-15 14:37:32.917627	Полки	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Длина","type":"Number","id":2,"min":0,"max":null,"hint":"см","is_int":true},{"name":"Материал","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Цвет","type":"Text","id":4,"min":0,"max":null,"hint":null}]	596/600	t
594	2020-10-15 14:37:32.719761	2020-10-15 14:37:32.932547	Порошки	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Вес","type":"Number","id":2,"min":0,"max":null,"hint":"кг","is_int":false},{"name":"Срок годности","type":"Number","id":3,"min":0,"max":null,"hint":"мес","is_int":false}]	596/601	t
595	2020-10-15 14:37:32.735404	2020-10-15 14:37:32.947618	Отбеливатели	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Вес","type":"Number","id":2,"min":0,"max":null,"hint":"кг","is_int":false},{"name":"Срок годности","type":"Number","id":3,"min":0,"max":null,"hint":"мес","is_int":false}]	596/601	t
583	2020-10-15 14:37:32.454537	2020-10-15 14:37:32.454537	Цифровая техника	\N	\N	f
584	2020-10-15 14:37:32.460202	2020-10-15 14:37:32.460202	Переферия	\N	583	f
579	2020-10-15 14:37:32.347591	2020-10-15 14:37:32.476738	Фото и видео-техника	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Зеркальный","type":"Bool","id":2,"min":null,"max":null,"hint":null},{"name":"Максимальное увеличение","type":"Number","id":3,"min":0,"max":null,"hint":null,"is_int":true},{"name":"Разрешение","type":"Number","id":4,"min":0,"max":null,"hint":"пикселей","is_int":true},{"name":"Вспышка","type":"Bool","id":5,"min":null,"max":null,"hint":null}]	583	t
580	2020-10-15 14:37:32.392174	2020-10-15 14:37:32.493973	Смартфоны	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Диагональ","type":"Number","id":2,"min":0,"max":null,"hint":"пикселей","is_int":false},{"name":"Процессор","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Объем ОЗУ","type":"Number","id":4,"min":0,"max":null,"hint":"gb","is_int":true},{"name":"Объем ОЗУ","type":"Number","id":5,"min":0,"max":null,"hint":"gb","is_int":true},{"name":"Слот под карту памяти","type":"Bool","id":6,"min":null,"max":null,"hint":null},{"name":"WI-FI","type":"Bool","id":7,"min":null,"max":null,"hint":null},{"name":"GPS","type":"Bool","id":8,"min":null,"max":null,"hint":null},{"name":"Разрешение камеры","type":"Number","id":9,"min":0,"max":null,"hint":"MP","is_int":true},{"name":"Влагозащита","type":"Bool","id":10,"min":null,"max":null,"hint":null},{"name":"NFC","type":"Bool","id":11,"min":null,"max":null,"hint":null},{"name":"Емкость аккумулятора","type":"Number","id":12,"min":null,"max":null,"hint":null,"is_int":true},{"name":"Операционная система","type":"Text","id":13,"min":null,"max":null,"hint":null}]	583	t
582	2020-10-15 14:37:32.450429	2020-10-15 14:37:32.506505	Компьютерные мыши	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Игровая","type":"Bool","id":2,"min":null,"max":null,"hint":null},{"name":"Разрешение сенсора","type":"Number","id":3,"min":0,"max":null,"hint":"DPI","is_int":true},{"name":"Тип подключения","type":"Text","id":4,"min":0,"max":null,"hint":null},{"name":"Цвет","type":"Text","id":5,"min":0,"max":null,"hint":null},{"name":"Цвет подсветки","type":"Text","id":6,"min":0,"max":null,"hint":null},{"name":"Количество клавиш","type":"Number","id":7,"min":0,"max":null,"hint":"gb","is_int":true},{"name":"Подсветка","type":"Bool","id":8,"min":null,"max":null,"hint":null}]	583/584	t
581	2020-10-15 14:37:32.42133	2020-10-15 14:37:32.52045	Клавиатуры	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Игровая","type":"Bool","id":2,"min":null,"max":null,"hint":null},{"name":"Тип клавиш","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Тип подключения","type":"Text","id":4,"min":0,"max":null,"hint":null},{"name":"Цвет","type":"Text","id":5,"min":0,"max":null,"hint":null},{"name":"Цвет подсветки","type":"Text","id":6,"min":0,"max":null,"hint":null},{"name":"Количество клавиш","type":"Number","id":7,"min":0,"max":null,"hint":"gb","is_int":true},{"name":"Подсветка","type":"Bool","id":8,"min":null,"max":null,"hint":null}]	583/584	t
586	2020-10-15 14:37:32.577333	2020-10-15 14:37:32.792951	Обогреватели	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Максимальная мощность","type":"Number","id":2,"min":0,"max":null,"hint":"ВТ","is_int":true},{"name":"Площадь обогрева","type":"Number","id":3,"min":0,"max":null,"hint":"кв.м","is_int":false},{"name":"Количество секций","type":"Number","id":4,"min":0,"max":null,"hint":null,"is_int":true},{"name":"Вентилятор","type":"Bool","id":5,"min":null,"max":null,"hint":null},{"name":"Термостат","type":"Bool","id":6,"min":null,"max":null,"hint":null},{"name":"Таймер","type":"Bool","id":7,"min":null,"max":null,"hint":null}]	596/597	t
587	2020-10-15 14:37:32.600097	2020-10-15 14:37:32.80552	Ножи	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Длина","type":"Number","id":2,"min":0,"max":null,"hint":"см","is_int":true},{"name":"Материал режущей части","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Материал ручки","type":"Text","id":4,"min":0,"max":null,"hint":null},{"name":"Зазубренность","type":"Bool","id":5,"min":null,"max":null,"hint":null}]	596/598	t
588	2020-10-15 14:37:32.61673	2020-10-15 14:37:32.819717	Сервировка	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Количество в наборе","type":"Number","id":2,"min":0,"max":null,"hint":null,"is_int":true},{"name":"Материал","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Цвет","type":"Text","id":4,"min":0,"max":null,"hint":null}]	596/598	t
590	2020-10-15 14:37:32.648507	2020-10-15 14:37:32.838486	Сковородки	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Диаметр","type":"Number","id":2,"min":0,"max":null,"hint":"см","is_int":true},{"name":"Материал","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Покрытие","type":"Text","id":4,"min":0,"max":null,"hint":null}]	596/598/599	t
589	2020-10-15 14:37:32.633064	2020-10-15 14:37:32.862172	Кастрюли	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Объем","type":"Number","id":2,"min":0,"max":null,"hint":"мл","is_int":true},{"name":"Материал","type":"Text","id":3,"min":0,"max":null,"hint":null},{"name":"Покрытие","type":"Text","id":4,"min":0,"max":null,"hint":null}]	596/598/599	t
591	2020-10-15 14:37:32.672576	2020-10-15 14:37:32.886569	Лампы	[{"name":"Изображения","type":"Images","id":1,"min":null,"max":null,"hint":null},{"name":"Мощность","type":"Number","id":2,"min":0,"max":null,"hint":"ВТ","is_int":true},{"name":"Световой поток","type":"Number","id":3,"min":0,"max":null,"hint":"Лм","is_int":true},{"name":"Цветовая температура","type":"Number","id":4,"min":0,"max":null,"hint":"К","is_int":true},{"name":"Энергосберегающая","type":"Bool","id":5,"min":null,"max":null,"hint":null}]	596/600	t
\.


--
-- Data for Name: categories_makers; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.categories_makers (id, category_id, maker_id) FROM stdin;
1	1	2
2	1	3
3	1	4
4	1	1
5	2	3
6	2	5
7	2	6
8	2	1
9	3	8
10	3	9
11	3	10
12	3	7
13	4	9
14	4	11
15	4	12
16	4	7
17	5	14
18	5	15
19	5	16
20	5	13
21	6	15
22	6	17
23	6	18
24	6	13
25	7	20
26	7	21
27	7	22
28	7	19
29	8	21
30	8	23
31	8	24
32	8	19
33	9	26
34	9	27
35	9	28
36	9	25
37	10	27
38	10	29
39	10	30
40	10	25
41	11	32
42	11	33
43	11	34
44	11	31
45	12	33
46	12	35
47	12	36
48	12	31
49	13	38
50	13	39
51	13	40
52	13	37
53	14	39
54	14	41
55	14	42
56	14	37
57	15	44
58	15	45
59	15	46
60	15	43
61	16	45
62	16	47
63	16	48
64	16	43
65	17	50
66	17	51
67	17	52
68	17	49
69	18	51
70	18	53
71	18	54
72	18	49
73	19	56
74	19	57
75	19	58
76	19	55
77	20	57
78	20	59
79	20	60
80	20	55
81	21	62
82	21	63
83	21	64
84	21	61
85	22	63
86	22	65
87	22	66
88	22	61
89	23	68
90	23	69
91	23	70
92	23	67
93	24	69
94	24	71
95	24	72
96	24	67
97	26	74
98	26	75
99	26	76
100	26	73
101	27	75
102	27	77
103	27	78
104	27	73
105	29	80
106	29	81
107	29	82
108	29	79
109	30	81
110	30	83
111	30	84
112	30	79
113	32	86
114	32	87
115	32	88
116	32	85
117	33	87
118	33	89
119	33	90
120	33	85
121	35	92
122	35	93
123	35	94
124	35	91
125	36	93
126	36	95
127	36	96
128	36	91
129	38	98
130	38	99
131	38	100
132	38	97
133	39	99
134	39	101
135	39	102
136	39	97
137	43	104
138	43	105
139	43	106
140	43	103
141	44	105
142	44	107
143	44	108
144	44	103
145	48	110
146	48	111
147	48	112
148	48	109
149	49	111
150	49	113
151	49	114
152	49	109
153	53	116
154	53	117
155	53	118
156	53	115
157	54	117
158	54	119
159	54	120
160	54	115
161	58	122
162	58	123
163	58	124
164	58	121
165	59	123
166	59	125
167	59	126
168	59	121
169	63	128
170	63	129
171	63	130
172	63	127
173	64	129
174	64	131
175	64	132
176	64	127
177	68	134
178	68	135
179	68	136
180	68	133
181	69	135
182	69	137
183	69	138
184	69	133
185	71	140
186	71	141
187	71	142
188	71	139
189	72	141
190	72	143
191	72	144
192	72	139
193	76	146
194	76	147
195	76	148
196	76	145
197	77	147
198	77	149
199	77	150
200	77	145
201	81	152
202	81	153
203	81	154
204	81	151
205	82	153
206	82	155
207	82	156
208	82	151
209	86	158
210	86	159
211	86	160
212	86	157
213	87	159
214	87	161
215	87	162
216	87	157
217	91	164
218	91	165
219	91	166
220	91	163
221	92	165
222	92	167
223	92	168
224	92	163
225	96	170
226	96	171
227	96	172
228	96	169
229	97	171
230	97	173
231	97	174
232	97	169
233	99	176
234	99	177
235	99	178
236	99	175
237	100	177
238	100	179
239	100	180
240	100	175
241	102	182
242	102	183
243	102	184
244	102	181
245	103	183
246	103	185
247	103	186
248	103	181
249	108	188
250	108	189
251	108	190
252	108	187
253	109	189
254	109	191
255	109	192
256	109	187
257	114	194
258	114	195
259	114	196
260	113	194
261	113	195
262	113	196
263	114	193
264	115	195
265	115	197
266	115	198
267	115	193
268	120	200
269	120	201
270	120	202
271	119	200
272	119	201
273	119	202
274	119	199
275	120	199
276	121	201
277	121	203
278	121	204
279	121	199
280	126	206
281	126	207
282	126	208
283	125	206
284	125	207
285	125	208
286	125	205
287	126	205
288	127	207
289	127	209
290	127	210
291	127	205
292	132	212
293	132	213
294	132	214
295	131	212
296	131	213
297	131	214
298	131	211
299	132	211
300	133	213
301	133	215
302	133	216
303	133	211
608	561	376
609	561	377
610	562	376
611	563	376
612	564	376
613	566	376
614	565	376
615	567	376
616	571	376
617	572	376
618	573	376
619	574	376
620	575	376
621	576	376
622	579	376
623	580	376
624	582	376
625	581	376
626	585	376
627	586	376
628	587	376
629	588	376
630	590	376
631	589	376
632	591	376
633	592	376
634	593	376
635	594	376
636	595	376
\.


--
-- Data for Name: makers; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.makers (id, name, created_at, updated_at, is_another) FROM stdin;
376	Другое	2020-10-15 14:37:31.786358	2020-10-15 14:37:31.786358	t
377	Apple	2020-10-15 14:37:31.79103	2020-10-15 14:37:31.79103	f
378	Samsung	2020-10-15 14:37:31.79525	2020-10-15 14:37:31.79525	f
379	Xiaomi	2020-10-15 14:37:31.800096	2020-10-15 14:37:31.800096	f
380	Sony	2020-10-15 14:37:31.80444	2020-10-15 14:37:31.80444	f
381	Polar	2020-10-15 14:37:31.808971	2020-10-15 14:37:31.808971	f
\.


--
-- Data for Name: ordered_products; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.ordered_products (id, order_id, product_id, quantity, data, title, description, price, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.orders (id, user_id, name, surname, phone, email, shop_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: orders_products; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.orders_products (id, order_id, product_id, created_at, updated_at, quantity) FROM stdin;
9	13	173	2020-08-27 15:26:51.315833	2020-08-27 15:26:51.315833	1
10	13	170	2020-08-27 15:26:51.324415	2020-08-27 15:26:51.324415	1
11	14	178	2020-08-27 15:26:51.34852	2020-08-27 15:26:51.34852	1
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.posts (id, user_id, product_id, body, mark, created_at, updated_at, ancestry) FROM stdin;
1	5	127	14124214	4	2020-08-01 15:34:37.467338	2020-08-01 15:34:37.758258	\N
2	5	127	14124214	4	2020-08-01 15:34:59.172196	2020-08-01 15:34:59.238181	\N
3	5	127	14214124	1	2020-08-01 15:37:29.239495	2020-08-01 15:37:29.335245	\N
4	5	127	124124	0	2020-08-01 15:37:55.763477	2020-08-01 15:37:55.813024	\N
5	5	127	124124124	3	2020-08-01 15:39:10.797596	2020-08-01 15:39:10.816999	\N
6	5	127	124124	3	2020-08-01 15:39:43.645958	2020-08-01 15:39:43.69193	\N
7	5	127	124124	4	2020-08-01 15:39:59.211475	2020-08-01 15:39:59.228208	\N
8	5	127	124124124124124214214	4	2020-08-01 15:51:04.590599	2020-08-01 15:51:04.590599	\N
9	5	127	124124124124214214	4	2020-08-01 16:03:49.720533	2020-08-01 16:03:49.720533	\N
10	5	127	qr1q2r141241	4	2020-08-01 16:10:24.27544	2020-08-01 16:10:24.297681	\N
11	5	128	                         	0	2020-08-02 12:59:12.122747	2020-08-02 12:59:12.122747	\N
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.products (id, title, price, maker_name, custom_maker, created_at, updated_at, category_id, maker_id, shop_id, description, quantity, is_inf_quantity, mark) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.schema_migrations (version) FROM stdin;
20200715112210
20200715112324
20200715114227
20200715115025
20200715152159
20200715153609
20200715155728
20200719140749
20200719140818
20200719161948
20200719165245
20200720073120
20200720092204
20200720092415
20200720101225
20200726094250
20200728100716
20200728111841
20200729102836
20200730095519
20200801091843
20200801091941
20200806111709
20200806112952
20200808133102
20200809081820
20200809102136
20200814084336
20200814115522
20200815113307
20200818073700
20200819125336
20200823072458
20200823092711
20200824143019
20200827134558
20200827135248
20200827140344
20200827142414
20200827150639
20200827150748
20200827151219
20200828055837
20200830094819
20200830103913
20200907132601
20200907132734
20200912080057
20200913150230
20200913150257
20200914123314
20200919101643
\.


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.shops (id, name, created_at, updated_at, top_cat, mail, description, phone, user_id, inn, vk, fb, tg, wu) FROM stdin;
220	China International	2020-10-15 14:37:31.768125	2020-10-15 14:37:31.768125	[]	\N	\N	\N	83	\N	\N	\N	\N	\N
221	РашнБестБайСторЕвер	2020-10-15 14:37:31.775308	2020-10-15 14:37:31.775308	[]	\N	\N	\N	83	\N	\N	\N	\N	\N
222	Семерочка	2020-10-15 14:37:31.782692	2020-10-15 14:37:31.782692	[]	\N	\N	\N	83	\N	\N	\N	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.users (id, email, phone, name, surname, password_digest, created_at, updated_at, restore_date, street, city, state, country, zip, suburb, county, restore_code, restore_code_task_started, confirmed, email_temp, email_temp_code, change_code_task_started, third_name) FROM stdin;
83	john.doe@gmail.com	88005553535	John	Doe	$2a$12$5E9LwLxkpGvJISXhVPT7p.vdmYEmS6kVJTtG6ncPNib.hyjHHh/OK	2020-10-15 14:37:31.758174	2020-10-15 14:37:31.758174	2020-10-15 14:37:31.754897	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	\N	\N
\.


--
-- Data for Name: wishes; Type: TABLE DATA; Schema: public; Owner: nekwebshop
--

COPY public.wishes (id, user_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 553, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 455, true);


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.addresses_id_seq', 146, true);


--
-- Name: attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.attributes_id_seq', 454, true);


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.carts_id_seq', 152, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.categories_id_seq', 601, true);


--
-- Name: categories_makers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.categories_makers_id_seq', 636, true);


--
-- Name: makers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.makers_id_seq', 381, true);


--
-- Name: ordered_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.ordered_products_id_seq', 99, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.orders_id_seq', 97, true);


--
-- Name: orders_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.orders_products_id_seq', 11, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.posts_id_seq', 112, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.products_id_seq', 226, true);


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.shops_id_seq', 222, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.users_id_seq', 83, true);


--
-- Name: wishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nekwebshop
--

SELECT pg_catalog.setval('public.wishes_id_seq', 17, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attributes attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.attributes
    ADD CONSTRAINT attributes_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories_makers categories_makers_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.categories_makers
    ADD CONSTRAINT categories_makers_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: makers makers_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.makers
    ADD CONSTRAINT makers_pkey PRIMARY KEY (id);


--
-- Name: ordered_products ordered_products_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.ordered_products
    ADD CONSTRAINT ordered_products_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders_products orders_products_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: shops shops_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wishes wishes_pkey; Type: CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.wishes
    ADD CONSTRAINT wishes_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: nekwebshop
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: nekwebshop
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: nekwebshop
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_categories_makers_on_category_id; Type: INDEX; Schema: public; Owner: nekwebshop
--

CREATE INDEX index_categories_makers_on_category_id ON public.categories_makers USING btree (category_id);


--
-- Name: index_categories_makers_on_maker_id; Type: INDEX; Schema: public; Owner: nekwebshop
--

CREATE INDEX index_categories_makers_on_maker_id ON public.categories_makers USING btree (maker_id);


--
-- Name: index_categories_on_ancestry; Type: INDEX; Schema: public; Owner: nekwebshop
--

CREATE INDEX index_categories_on_ancestry ON public.categories USING btree (ancestry);


--
-- Name: index_posts_on_ancestry; Type: INDEX; Schema: public; Owner: nekwebshop
--

CREATE INDEX index_posts_on_ancestry ON public.posts USING btree (ancestry);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: nekwebshop
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

