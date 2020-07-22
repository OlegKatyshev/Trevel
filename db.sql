--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: city; Type: TABLE; Schema: public; Owner: yii_user
--

CREATE TABLE public.city (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    id_country integer
);


ALTER TABLE public.city OWNER TO yii_user;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: yii_user
--

CREATE SEQUENCE public.city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_id_seq OWNER TO yii_user;

--
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yii_user
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: yii_user
--

CREATE TABLE public.country (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    eng_name character varying(30)
);


ALTER TABLE public.country OWNER TO yii_user;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: yii_user
--

CREATE SEQUENCE public.country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO yii_user;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yii_user
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: hotel; Type: TABLE; Schema: public; Owner: yii_user
--

CREATE TABLE public.hotel (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    id_city integer,
    id_country integer,
    street character varying(200),
    home smallint,
    phone character varying(20),
    stars smallint,
    gym boolean,
    spool boolean,
    parking boolean,
    beach boolean,
    line smallint
);


ALTER TABLE public.hotel OWNER TO yii_user;

--
-- Name: hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: yii_user
--

CREATE SEQUENCE public.hotel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotel_id_seq OWNER TO yii_user;

--
-- Name: hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yii_user
--

ALTER SEQUENCE public.hotel_id_seq OWNED BY public.hotel.id;


--
-- Name: image; Type: TABLE; Schema: public; Owner: yii_user
--

CREATE TABLE public.image (
    id_hotel integer,
    name character varying(20)
);


ALTER TABLE public.image OWNER TO yii_user;

--
-- Name: tur; Type: TABLE; Schema: public; Owner: yii_user
--

CREATE TABLE public.tur (
    id integer NOT NULL,
    id_hotel integer,
    price money,
    food character varying(20),
    sell smallint,
    transfer boolean,
    date_s date,
    date_e date,
    CONSTRAINT sell CHECK (((sell > '-1'::integer) AND (sell < 99)))
);


ALTER TABLE public.tur OWNER TO yii_user;

--
-- Name: tur_id_seq; Type: SEQUENCE; Schema: public; Owner: yii_user
--

CREATE SEQUENCE public.tur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tur_id_seq OWNER TO yii_user;

--
-- Name: tur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yii_user
--

ALTER SEQUENCE public.tur_id_seq OWNED BY public.tur.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.hotel ALTER COLUMN id SET DEFAULT nextval('public.hotel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.tur ALTER COLUMN id SET DEFAULT nextval('public.tur_id_seq'::regclass);


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: yii_user
--

COPY public.city (id, name, id_country) FROM stdin;
1	Варадеро	1
2	шарм эль шейх	2
3	Крит	3
4	Римини	4
5	Канкун	5
6	Каталония	6
7	Пхукет	7
8	Нячанг	8
\.


--
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yii_user
--

SELECT pg_catalog.setval('public.city_id_seq', 8, true);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: yii_user
--

COPY public.country (id, name, eng_name) FROM stdin;
7	Тайланд	thai
2	Египет	egypt
3	Греция	greece
4	Италия	italy
5	Мексика	mexico
6	Испания	spain
8	Вьетнам	vietnam
1	Куба	cuba
\.


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yii_user
--

SELECT pg_catalog.setval('public.country_id_seq', 8, true);


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: yii_user
--

COPY public.hotel (id, name, id_city, id_country, street, home, phone, stars, gym, spool, parking, beach, line) FROM stdin;
2	Hotel Beach Resort-2	1	1	street first	1	32133456789	4	t	t	f	t	1
3	Hotel Beach SPA-3	1	1	street second	2	84773456878	5	t	t	t	t	2
4	Hotel Beach Jazz-4	1	1	street third	3	64473411178	4	t	t	f	t	1
5	Hotel Madison-5	1	1	street main	4	12123456565	5	t	t	t	t	2
6	Hotel Arona Gran-6	1	1	street rongle rod	5	23113456878	4	f	t	f	t	1
7	Hotel Beach Hilton-7	1	1	street cabana	6	98783456871	5	f	t	t	t	2
8	Hotel Jack Slim-8	1	1	street main road	7	84455456811	4	f	t	f	t	1
9	Hotel Marriott-9	1	1	street sobar	8	56573456871	5	t	t	t	t	2
10	Hotel Holiday Inn-10	1	1	street land pl	9	77873452378	5	t	t	f	t	1
11	Hotel Sheratont-11	1	1	street second cabana	10	97783456118	4	f	t	t	t	2
12	Hotel Beach Resort-12	2	2	street first	1	32133456789	4	t	t	f	t	1
13	Hotel Beach SPA-13	2	2	street second	2	84773456878	5	t	t	t	t	2
14	Hotel Beach Jazz-14	2	2	street third	3	64473411178	4	t	t	f	t	1
15	Hotel Madison-15	2	2	street main	4	12123456565	5	t	t	t	t	2
16	Hotel Arona Gran-16	2	2	street rongle rod	5	23113456878	4	f	t	f	t	1
17	Hotel Beach Hilton-17	2	2	street cabana	6	98783456871	5	f	t	t	t	2
18	Hotel Jack Slim-18	2	2	street main road	7	84455456811	4	f	t	f	t	1
19	Hotel Marriott-19	2	2	street sobar	8	56573456871	5	t	t	t	t	2
20	Hotel Holiday Inn-20	2	2	street land pl	9	77873452378	5	t	t	f	t	1
21	Hotel Sheratont-21	2	2	street second cabana	10	97783456118	4	f	t	t	t	2
22	Hotel Beach Resort-22	3	3	street first	1	32133456789	4	t	t	f	t	1
23	Hotel Beach SPA-23	3	3	street second	2	84773456878	5	t	t	t	t	2
24	Hotel Beach Jazz-24	3	3	street third	3	64473411178	4	t	t	f	t	1
25	Hotel Madison-25	3	3	street main	4	12123456565	5	t	t	t	t	2
26	Hotel Arona Gran-26	3	3	street rongle rod	5	23113456878	4	f	t	f	t	1
27	Hotel Beach Hilton-27	3	3	street cabana	6	98783456871	5	f	t	t	t	2
28	Hotel Jack Slim-28	3	3	street main road	7	84455456811	4	f	t	f	t	1
29	Hotel Marriott-29	3	3	street sobar	8	56573456871	5	t	t	t	t	2
30	Hotel Holiday Inn-30	3	3	street land pl	9	77873452378	5	t	t	f	t	1
31	Hotel Sheratont-31	3	3	street second cabana	10	97783456118	4	f	t	t	t	2
32	Hotel Beach Resort-32	4	4	street first	1	32133456789	4	t	t	f	t	1
33	Hotel Beach SPA-33	4	4	street second	2	84773456878	5	t	t	t	t	2
34	Hotel Beach Jazz-34	4	4	street third	3	64473411178	4	t	t	f	t	1
35	Hotel Madison-35	4	4	street main	4	12123456565	5	t	t	t	t	2
37	Hotel Beach Hilton-37	4	4	street cabana	6	98783456871	5	f	t	t	t	2
38	Hotel Jack Slim-38	4	4	street main road	7	84455456811	4	f	t	f	t	1
39	Hotel Marriott-39	4	4	street sobar	8	56573456871	5	t	t	t	t	2
40	Hotel Holiday Inn-40	4	4	street land pl	9	77873452378	5	t	t	f	t	1
41	Hotel Sheratont-41	4	4	street second cabana	10	97783456118	4	f	t	t	t	2
42	Hotel Beach Resort-42	5	5	street first	1	32133456789	4	t	t	f	t	1
43	Hotel Beach SPA-43	5	5	street second	2	84773456878	5	t	t	t	t	2
44	Hotel Beach Jazz-44	5	5	street third	3	64473411178	4	t	t	f	t	1
45	Hotel Madison-45	5	5	street main	4	12123456565	5	t	t	t	t	2
46	Hotel Arona Gran-46	5	5	street rongle rod	5	23113456878	4	f	t	f	t	1
47	Hotel Beach Hilton-47	5	5	street cabana	6	98783456871	5	f	t	t	t	2
48	Hotel Jack Slim-48	5	5	street main road	7	84455456811	4	f	t	f	t	1
49	Hotel Marriott-49	5	5	street sobar	8	56573456871	5	t	t	t	t	2
51	Hotel Sheratont-51	5	5	street second cabana	10	97783456118	4	f	t	t	t	2
52	Hotel Beach Resort-52	6	6	street first	1	32133456789	4	t	t	f	t	1
53	Hotel Beach SPA-53	6	6	street second	2	84773456878	5	t	t	t	t	2
54	Hotel Beach Jazz-54	6	6	street third	3	64473411178	4	t	t	f	t	1
55	Hotel Madison-55	6	6	street main	4	12123456565	5	t	t	t	t	2
56	Hotel Arona Gran-56	6	6	street rongle rod	5	23113456878	4	f	t	f	t	1
57	Hotel Beach Hilton-57	6	6	street cabana	6	98783456871	5	f	t	t	t	2
58	Hotel Jack Slim-58	6	6	street main road	7	84455456811	4	f	t	f	t	1
59	Hotel Marriott-59	6	6	street sobar	8	56573456871	5	t	t	t	t	2
60	Hotel Holiday Inn-60	6	6	street land pl	9	77873452378	5	t	t	f	t	1
61	Hotel Sheratont-61	6	6	street second cabana	10	97783456118	4	f	t	t	t	2
63	Hotel Beach SPA-63	7	7	street second	2	84773456878	5	t	t	t	t	2
64	Hotel Beach Jazz-64	7	7	street third	3	64473411178	4	t	t	f	t	1
65	Hotel Madison-65	7	7	street main	4	12123456565	5	t	t	t	t	2
66	Hotel Arona Gran-66	7	7	street rongle rod	5	23113456878	4	f	t	f	t	1
67	Hotel Beach Hilton-67	7	7	street cabana	6	98783456871	5	f	t	t	t	2
68	Hotel Jack Slim-68	7	7	street main road	7	84455456811	4	f	t	f	t	1
69	Hotel Marriott-69	7	7	street sobar	8	56573456871	5	t	t	t	t	2
70	Hotel Holiday Inn-70	7	7	street land pl	9	77873452378	5	t	t	f	t	1
71	Hotel Sheratont-71	7	7	street second cabana	10	97783456118	4	f	t	t	t	2
72	Hotel Beach Resort-72	8	8	street first	1	32133456789	4	t	t	f	t	1
73	Hotel Beach SPA-73	8	8	street second	2	84773456878	5	t	t	t	t	2
74	Hotel Beach Jazz-74	8	8	street third	3	64473411178	4	t	t	f	t	1
76	Hotel Arona Gran-76	8	8	street rongle rod	5	23113456878	4	f	t	f	t	1
77	Hotel Beach Hilton-77	8	8	street cabana	6	98783456871	5	f	t	t	t	2
78	Hotel Jack Slim-78	8	8	street main road	7	84455456811	4	f	t	f	t	1
79	Hotel Marriott-79	8	8	street sobar	8	56573456871	5	t	t	t	t	2
80	Hotel Holiday Inn-80	8	8	street land pl	9	77873452378	5	t	t	f	t	1
81	Hotel Sheratont-81	8	8	street second cabana	10	97783456118	4	f	t	t	t	2
36	Hotel Arona Gran-36	4	4	street rongle rod	5	23113456878	4	f	t	f	t	1
50	Hotel Holiday Inn-50	5	5	street land pl	9	77873452378	5	t	t	f	t	1
62	Hotel Beach Resort-62	7	7	street first	1	32133456789	4	t	t	f	t	1
75	Hotel Madison-75	8	8	street main	4	12123456565	5	t	t	t	t	2
\.


--
-- Name: hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yii_user
--

SELECT pg_catalog.setval('public.hotel_id_seq', 81, true);


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: yii_user
--

COPY public.image (id_hotel, name) FROM stdin;
2	1
2	2
2	3
2	4
3	1
3	2
3	3
3	4
4	1
4	2
4	3
4	4
5	1
5	2
5	3
5	4
6	1
6	2
6	3
6	4
7	1
7	2
7	3
7	4
8	1
8	2
8	3
8	4
9	1
9	2
9	3
9	4
10	1
10	2
10	3
10	4
11	1
11	2
11	3
11	4
12	1
12	2
12	3
12	4
13	1
13	2
13	3
13	4
14	1
14	2
14	3
14	4
15	1
15	2
15	3
15	4
16	1
16	2
16	3
16	4
17	1
17	2
17	3
17	4
18	1
18	2
18	3
18	4
19	1
19	2
19	3
19	4
20	1
20	2
20	3
20	4
21	1
21	2
21	3
21	4
22	1
22	2
22	3
22	4
23	1
23	2
23	3
23	4
24	1
24	2
24	3
24	4
25	1
25	2
25	3
25	4
26	1
26	2
26	3
26	4
27	1
27	2
27	3
27	4
28	1
28	2
28	3
28	4
29	1
29	2
29	3
29	4
30	1
30	2
30	3
30	4
31	1
31	2
31	3
31	4
32	1
32	2
32	3
32	4
33	1
33	2
33	3
33	4
34	1
34	2
34	3
34	4
35	1
35	2
35	3
35	4
37	1
37	2
37	3
37	4
38	1
38	2
38	3
38	4
39	1
39	2
39	3
39	4
40	1
40	2
40	3
40	4
41	1
41	2
41	3
41	4
42	1
42	2
42	3
42	4
43	1
43	2
43	3
43	4
44	1
44	2
44	3
44	4
45	1
45	2
45	3
45	4
46	1
46	2
46	3
46	4
47	1
47	2
47	3
47	4
48	1
48	2
48	3
48	4
49	1
49	2
49	3
49	4
51	1
51	2
51	3
51	4
52	1
52	2
52	3
52	4
53	1
53	2
53	3
53	4
54	1
54	2
54	3
54	4
55	1
55	2
55	3
55	4
56	1
56	2
56	3
56	4
57	1
57	2
57	3
57	4
58	1
58	2
58	3
58	4
59	1
59	2
59	3
59	4
60	1
60	2
60	3
60	4
61	1
61	2
61	3
61	4
63	1
63	2
63	3
63	4
64	1
64	2
64	3
64	4
65	1
65	2
65	3
65	4
66	1
66	2
66	3
66	4
67	1
67	2
67	3
67	4
68	1
68	2
68	3
68	4
69	1
69	2
69	3
69	4
70	1
70	2
70	3
70	4
71	1
71	2
71	3
71	4
72	1
72	2
72	3
72	4
73	1
73	2
73	3
73	4
74	1
74	2
74	3
74	4
76	1
76	2
76	3
76	4
77	1
77	2
77	3
77	4
78	1
78	2
78	3
78	4
79	1
79	2
79	3
79	4
80	1
80	2
80	3
80	4
81	1
81	2
81	3
81	4
36	1
36	2
36	3
36	4
50	1
50	2
50	3
50	4
62	1
62	2
62	3
62	4
75	1
75	2
75	3
75	4
\.


--
-- Data for Name: tur; Type: TABLE DATA; Schema: public; Owner: yii_user
--

COPY public.tur (id, id_hotel, price, food, sell, transfer, date_s, date_e) FROM stdin;
1	2	90 000.00 руб	all	\N	t	2020-05-14	2020-05-30
2	3	90 000.00 руб	breakfast	\N	t	2020-05-14	2020-05-30
3	4	130 000.00 руб	all	\N	t	2020-05-01	2020-05-14
4	5	90 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-14
6	7	50 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
7	8	90 000.00 руб	breakfast and lunch	\N	t	2020-05-14	2020-05-30
8	9	140 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
9	10	100 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
10	11	50 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-14
11	12	60 000.00 руб	all	\N	t	2020-05-01	2020-05-30
12	13	150 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
13	14	100 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-30
14	15	120 000.00 руб	all	\N	t	2020-05-01	2020-05-30
15	16	110 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-30
16	17	50 000.00 руб	all	\N	t	2020-05-01	2020-05-30
18	19	60 000.00 руб	breakfast and lunch	\N	t	2020-05-14	2020-05-30
19	20	110 000.00 руб	breakfast	\N	t	2020-05-14	2020-05-30
20	21	80 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
21	22	110 000.00 руб	all	\N	t	2020-05-01	2020-05-14
22	23	150 000.00 руб	breakfast	\N	t	2020-05-14	2020-05-30
23	24	130 000.00 руб	breakfast	\N	t	2020-05-14	2020-05-30
24	25	50 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-14
25	26	120 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-14
26	27	140 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
27	28	140 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-14
28	29	60 000.00 руб	breakfast	\N	t	2020-05-14	2020-05-30
29	30	80 000.00 руб	all	\N	t	2020-05-14	2020-05-30
30	31	90 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-14
31	32	100 000.00 руб	all	\N	t	2020-05-01	2020-05-14
32	33	150 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-14
33	34	60 000.00 руб	all	\N	t	2020-05-01	2020-05-30
34	35	100 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-14
35	36	130 000.00 руб	all	\N	t	2020-05-14	2020-05-30
36	37	60 000.00 руб	all	\N	t	2020-05-01	2020-05-14
37	38	60 000.00 руб	breakfast and lunch	\N	t	2020-05-14	2020-05-30
38	39	50 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
39	40	150 000.00 руб	breakfast	\N	t	2020-05-14	2020-05-30
40	41	130 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
41	42	90 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-14
42	43	110 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
43	44	150 000.00 руб	all	\N	t	2020-05-14	2020-05-30
44	45	120 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-30
45	46	60 000.00 руб	all	\N	t	2020-05-01	2020-05-30
46	47	90 000.00 руб	all	\N	t	2020-05-14	2020-05-30
47	48	120 000.00 руб	all	\N	t	2020-05-01	2020-05-14
48	49	90 000.00 руб	breakfast and lunch	\N	t	2020-05-14	2020-05-30
49	50	140 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
50	51	80 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-30
51	52	110 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-30
52	53	90 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-30
53	54	140 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
54	55	130 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-14
55	56	120 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
56	57	140 000.00 руб	breakfast and lunch	\N	t	2020-05-14	2020-05-30
57	58	50 000.00 руб	breakfast and lunch	\N	t	2020-05-14	2020-05-30
58	59	140 000.00 руб	breakfast	\N	t	2020-05-14	2020-05-30
59	60	140 000.00 руб	all	\N	t	2020-05-01	2020-05-30
60	61	90 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-14
61	62	70 000.00 руб	breakfast and lunch	\N	t	2020-05-14	2020-05-30
62	63	80 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
63	64	50 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
64	65	90 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-14
65	66	90 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-30
66	67	120 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-14
67	68	130 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-14
68	69	90 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-30
69	70	60 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-14
70	71	80 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-14
71	72	130 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-14
72	73	70 000.00 руб	all	\N	t	2020-05-14	2020-05-30
73	74	50 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-30
74	75	110 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-14
75	76	100 000.00 руб	all	\N	t	2020-05-14	2020-05-30
76	77	150 000.00 руб	breakfast	\N	t	2020-05-01	2020-05-14
77	78	140 000.00 руб	breakfast and lunch	\N	t	2020-05-01	2020-05-30
78	79	60 000.00 руб	all	\N	t	2020-05-01	2020-05-14
79	80	90 000.00 руб	all	\N	t	2020-05-14	2020-05-30
80	81	50 000.00 руб	breakfast	\N	t	2020-05-14	2020-05-30
82	3	100 000.00 руб	all	\N	t	2020-06-14	2020-06-30
83	4	130 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-30
84	5	80 000.00 руб	all	\N	t	2020-06-01	2020-06-30
86	7	70 000.00 руб	all	\N	t	2020-06-01	2020-06-30
87	8	60 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-30
88	9	80 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-14
89	10	150 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-14
90	11	140 000.00 руб	all	\N	t	2020-06-14	2020-06-30
91	12	150 000.00 руб	all	\N	t	2020-06-01	2020-06-14
92	13	120 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-14
93	14	50 000.00 руб	all	\N	t	2020-06-01	2020-06-30
94	15	130 000.00 руб	breakfast and lunch	\N	t	2020-06-14	2020-06-30
95	16	150 000.00 руб	all	\N	t	2020-06-01	2020-06-14
96	17	100 000.00 руб	breakfast	\N	t	2020-06-14	2020-06-30
97	18	80 000.00 руб	breakfast and lunch	\N	t	2020-06-14	2020-06-30
98	19	80 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-30
99	20	80 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-14
100	21	90 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-14
101	22	120 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-30
102	23	140 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-14
103	24	80 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-14
104	25	100 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-30
105	26	130 000.00 руб	all	\N	t	2020-06-01	2020-06-30
106	27	100 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-30
107	28	100 000.00 руб	all	\N	t	2020-06-14	2020-06-30
109	30	60 000.00 руб	all	\N	t	2020-06-14	2020-06-30
110	31	130 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-14
111	32	120 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-30
112	33	50 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-30
113	34	50 000.00 руб	all	\N	t	2020-06-01	2020-06-14
114	35	70 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-30
115	36	150 000.00 руб	all	\N	t	2020-06-14	2020-06-30
116	37	90 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-30
117	38	100 000.00 руб	breakfast	\N	t	2020-06-14	2020-06-30
118	39	110 000.00 руб	breakfast and lunch	\N	t	2020-06-14	2020-06-30
119	40	70 000.00 руб	breakfast and lunch	\N	t	2020-06-14	2020-06-30
17	18	120 000.00 руб	breakfast and lunch	25	t	2020-05-01	2020-05-30
108	29	140 000.00 руб	breakfast	30	t	2020-06-14	2020-06-30
81	2	150 000.00 руб	breakfast	33	t	2020-06-14	2020-06-30
120	41	50 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-30
121	42	80 000.00 руб	breakfast and lunch	\N	t	2020-06-14	2020-06-30
122	43	130 000.00 руб	breakfast and lunch	\N	t	2020-06-14	2020-06-30
123	44	130 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-30
125	46	140 000.00 руб	all	\N	t	2020-06-14	2020-06-30
126	47	110 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-14
127	48	70 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-14
128	49	50 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-30
129	50	140 000.00 руб	all	\N	t	2020-06-14	2020-06-30
130	51	140 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-30
131	52	80 000.00 руб	all	\N	t	2020-06-01	2020-06-30
132	53	110 000.00 руб	breakfast and lunch	\N	t	2020-06-14	2020-06-30
133	54	50 000.00 руб	all	\N	t	2020-06-01	2020-06-30
134	55	100 000.00 руб	breakfast	\N	t	2020-06-14	2020-06-30
135	56	50 000.00 руб	all	\N	t	2020-06-14	2020-06-30
136	57	70 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-30
137	58	50 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-30
138	59	70 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-30
139	60	140 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-14
140	61	60 000.00 руб	all	\N	t	2020-06-01	2020-06-30
141	62	140 000.00 руб	all	\N	t	2020-06-01	2020-06-14
142	63	60 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-30
144	65	50 000.00 руб	breakfast	\N	t	2020-06-14	2020-06-30
145	66	140 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-14
146	67	50 000.00 руб	all	\N	t	2020-06-01	2020-06-30
147	68	150 000.00 руб	breakfast	\N	t	2020-06-14	2020-06-30
148	69	120 000.00 руб	all	\N	t	2020-06-14	2020-06-30
149	70	110 000.00 руб	breakfast and lunch	\N	t	2020-06-14	2020-06-30
150	71	90 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-30
151	72	140 000.00 руб	all	\N	t	2020-06-01	2020-06-30
152	73	130 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-30
153	74	150 000.00 руб	all	\N	t	2020-06-01	2020-06-14
154	75	120 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-14
155	76	110 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-14
156	77	100 000.00 руб	breakfast and lunch	\N	t	2020-06-01	2020-06-14
158	79	90 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-14
159	80	100 000.00 руб	breakfast	\N	t	2020-06-01	2020-06-14
160	81	130 000.00 руб	all	\N	t	2020-06-14	2020-06-30
161	2	110 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-30
162	3	70 000.00 руб	breakfast	\N	t	2020-07-14	2020-07-30
163	4	70 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-14
164	5	70 000.00 руб	all	\N	t	2020-07-01	2020-07-14
166	7	130 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-30
167	8	130 000.00 руб	breakfast and lunch	\N	t	2020-07-14	2020-07-30
168	9	120 000.00 руб	all	\N	t	2020-07-01	2020-07-30
169	10	150 000.00 руб	all	\N	t	2020-07-14	2020-07-30
170	11	80 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-30
171	12	100 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-14
172	13	50 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-14
173	14	110 000.00 руб	breakfast and lunch	\N	t	2020-07-14	2020-07-30
174	15	100 000.00 руб	all	\N	t	2020-07-01	2020-07-14
175	16	70 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-14
176	17	90 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-30
177	18	80 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-30
178	19	60 000.00 руб	all	\N	t	2020-07-14	2020-07-30
179	20	70 000.00 руб	all	\N	t	2020-07-01	2020-07-30
180	21	100 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-30
181	22	110 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-14
182	23	110 000.00 руб	breakfast	\N	t	2020-07-14	2020-07-30
183	24	140 000.00 руб	breakfast and lunch	\N	t	2020-07-14	2020-07-30
184	25	80 000.00 руб	breakfast	\N	t	2020-07-14	2020-07-30
185	26	120 000.00 руб	breakfast and lunch	\N	t	2020-07-14	2020-07-30
186	27	90 000.00 руб	breakfast	\N	t	2020-07-14	2020-07-30
187	28	60 000.00 руб	all	\N	t	2020-07-14	2020-07-30
188	29	70 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-14
189	30	100 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-30
190	31	60 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-30
191	32	120 000.00 руб	breakfast	\N	t	2020-07-14	2020-07-30
192	33	140 000.00 руб	breakfast	\N	t	2020-07-14	2020-07-30
193	34	100 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-14
194	35	130 000.00 руб	all	\N	t	2020-07-14	2020-07-30
195	36	120 000.00 руб	breakfast	\N	t	2020-07-14	2020-07-30
196	37	100 000.00 руб	all	\N	t	2020-07-01	2020-07-14
197	38	140 000.00 руб	breakfast	\N	t	2020-07-14	2020-07-30
198	39	140 000.00 руб	all	\N	t	2020-07-14	2020-07-30
199	40	80 000.00 руб	all	\N	t	2020-07-01	2020-07-14
200	41	60 000.00 руб	breakfast	\N	t	2020-07-14	2020-07-30
201	42	60 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-14
202	43	90 000.00 руб	all	\N	t	2020-07-01	2020-07-14
203	44	100 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-30
204	45	70 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-14
205	46	150 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-14
206	47	150 000.00 руб	all	\N	t	2020-07-01	2020-07-14
207	48	140 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-30
208	49	50 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-30
209	50	70 000.00 руб	all	\N	t	2020-07-01	2020-07-14
210	51	100 000.00 руб	breakfast and lunch	\N	t	2020-07-14	2020-07-30
211	52	150 000.00 руб	all	\N	t	2020-07-01	2020-07-30
212	53	100 000.00 руб	all	\N	t	2020-07-01	2020-07-14
213	54	90 000.00 руб	breakfast and lunch	\N	t	2020-07-14	2020-07-30
214	55	60 000.00 руб	breakfast	\N	t	2020-07-14	2020-07-30
215	56	80 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-14
216	57	80 000.00 руб	all	\N	t	2020-07-14	2020-07-30
217	58	60 000.00 руб	all	\N	t	2020-07-01	2020-07-14
218	59	120 000.00 руб	breakfast and lunch	\N	t	2020-07-14	2020-07-30
219	60	50 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-14
220	61	50 000.00 руб	all	\N	t	2020-07-01	2020-07-14
221	62	130 000.00 руб	all	\N	t	2020-07-01	2020-07-14
222	63	70 000.00 руб	all	\N	t	2020-07-01	2020-07-14
223	64	50 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-30
224	65	130 000.00 руб	all	\N	t	2020-07-01	2020-07-30
225	66	50 000.00 руб	breakfast and lunch	\N	t	2020-07-14	2020-07-30
226	67	50 000.00 руб	all	\N	t	2020-07-14	2020-07-30
227	68	50 000.00 руб	breakfast	\N	t	2020-07-01	2020-07-14
228	69	90 000.00 руб	all	\N	t	2020-07-01	2020-07-30
229	70	110 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-30
230	71	90 000.00 руб	all	\N	t	2020-07-01	2020-07-30
231	72	140 000.00 руб	all	\N	t	2020-07-01	2020-07-14
232	73	80 000.00 руб	breakfast	\N	t	2020-07-14	2020-07-30
233	74	60 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-30
234	75	150 000.00 руб	all	\N	t	2020-07-01	2020-07-30
235	76	60 000.00 руб	breakfast and lunch	\N	t	2020-07-01	2020-07-14
236	77	100 000.00 руб	all	\N	t	2020-07-01	2020-07-14
238	79	100 000.00 руб	breakfast	\N	t	2020-07-14	2020-07-30
239	80	60 000.00 руб	all	\N	t	2020-07-01	2020-07-14
240	81	70 000.00 руб	all	\N	t	2020-07-01	2020-07-14
124	45	130 000.00 руб	breakfast	15	t	2020-06-14	2020-06-30
157	78	120 000.00 руб	breakfast and lunch	30	t	2020-06-01	2020-06-14
241	2	50 000.00 руб	breakfast and lunch	\N	t	2020-08-14	2020-08-30
242	3	110 000.00 руб	all	\N	t	2020-08-01	2020-08-14
243	4	130 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-30
244	5	90 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-14
245	6	70 000.00 руб	all	\N	t	2020-08-01	2020-08-14
246	7	130 000.00 руб	all	\N	t	2020-08-01	2020-08-14
247	8	100 000.00 руб	all	\N	t	2020-08-01	2020-08-14
248	9	130 000.00 руб	breakfast	\N	t	2020-08-14	2020-08-30
249	10	70 000.00 руб	all	\N	t	2020-08-01	2020-08-14
250	11	100 000.00 руб	all	\N	t	2020-08-14	2020-08-30
251	12	70 000.00 руб	breakfast	\N	t	2020-08-14	2020-08-30
252	13	50 000.00 руб	breakfast	\N	t	2020-08-14	2020-08-30
253	14	100 000.00 руб	breakfast and lunch	\N	t	2020-08-01	2020-08-30
254	15	50 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-14
255	16	50 000.00 руб	breakfast	\N	t	2020-08-14	2020-08-30
256	17	60 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-14
257	18	90 000.00 руб	breakfast and lunch	\N	t	2020-08-01	2020-08-30
258	19	120 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-14
259	20	150 000.00 руб	breakfast and lunch	\N	t	2020-08-14	2020-08-30
260	21	80 000.00 руб	all	\N	t	2020-08-01	2020-08-14
261	22	120 000.00 руб	breakfast and lunch	\N	t	2020-08-01	2020-08-14
262	23	130 000.00 руб	breakfast	\N	t	2020-08-14	2020-08-30
263	24	100 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-30
264	25	110 000.00 руб	all	\N	t	2020-08-01	2020-08-14
265	26	130 000.00 руб	breakfast and lunch	\N	t	2020-08-14	2020-08-30
266	27	90 000.00 руб	breakfast	\N	t	2020-08-14	2020-08-30
267	28	80 000.00 руб	all	\N	t	2020-08-14	2020-08-30
268	29	80 000.00 руб	breakfast and lunch	\N	t	2020-08-01	2020-08-14
269	30	130 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-30
270	31	110 000.00 руб	all	\N	t	2020-08-01	2020-08-14
271	32	60 000.00 руб	all	\N	t	2020-08-01	2020-08-14
272	33	70 000.00 руб	breakfast	\N	t	2020-08-14	2020-08-30
273	34	110 000.00 руб	breakfast and lunch	\N	t	2020-08-01	2020-08-30
274	35	130 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-30
275	36	100 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-14
276	37	120 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-30
277	38	70 000.00 руб	all	\N	t	2020-08-01	2020-08-14
278	39	120 000.00 руб	all	\N	t	2020-08-14	2020-08-30
279	40	100 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-30
280	41	90 000.00 руб	breakfast and lunch	\N	t	2020-08-14	2020-08-30
281	42	150 000.00 руб	breakfast	\N	t	2020-08-14	2020-08-30
282	43	60 000.00 руб	all	\N	t	2020-08-14	2020-08-30
283	44	50 000.00 руб	all	\N	t	2020-08-01	2020-08-30
284	45	110 000.00 руб	breakfast	\N	t	2020-08-14	2020-08-30
285	46	150 000.00 руб	all	\N	t	2020-08-14	2020-08-30
286	47	130 000.00 руб	all	\N	t	2020-08-01	2020-08-14
287	48	80 000.00 руб	all	\N	t	2020-08-14	2020-08-30
288	49	110 000.00 руб	all	\N	t	2020-08-01	2020-08-30
289	50	100 000.00 руб	all	\N	t	2020-08-01	2020-08-30
290	51	130 000.00 руб	breakfast	\N	t	2020-08-14	2020-08-30
291	52	50 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-14
292	53	60 000.00 руб	all	\N	t	2020-08-01	2020-08-14
293	54	60 000.00 руб	all	\N	t	2020-08-14	2020-08-30
294	55	80 000.00 руб	all	\N	t	2020-08-01	2020-08-14
295	56	80 000.00 руб	breakfast and lunch	\N	t	2020-08-01	2020-08-14
296	57	80 000.00 руб	all	\N	t	2020-08-01	2020-08-14
297	58	60 000.00 руб	all	\N	t	2020-08-14	2020-08-30
298	59	130 000.00 руб	breakfast and lunch	\N	t	2020-08-01	2020-08-30
299	60	140 000.00 руб	breakfast and lunch	\N	t	2020-08-14	2020-08-30
300	61	150 000.00 руб	breakfast and lunch	\N	t	2020-08-14	2020-08-30
301	62	150 000.00 руб	breakfast and lunch	\N	t	2020-08-14	2020-08-30
302	63	120 000.00 руб	breakfast and lunch	\N	t	2020-08-14	2020-08-30
304	65	90 000.00 руб	all	\N	t	2020-08-01	2020-08-30
305	66	120 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-30
306	67	140 000.00 руб	breakfast and lunch	\N	t	2020-08-14	2020-08-30
307	68	70 000.00 руб	all	\N	t	2020-08-01	2020-08-30
308	69	70 000.00 руб	breakfast and lunch	\N	t	2020-08-01	2020-08-30
309	70	140 000.00 руб	all	\N	t	2020-08-01	2020-08-30
310	71	60 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-14
311	72	140 000.00 руб	breakfast and lunch	\N	t	2020-08-01	2020-08-14
312	73	50 000.00 руб	all	\N	t	2020-08-01	2020-08-14
313	74	130 000.00 руб	breakfast	\N	t	2020-08-14	2020-08-30
314	75	110 000.00 руб	breakfast and lunch	\N	t	2020-08-01	2020-08-30
315	76	100 000.00 руб	breakfast	\N	t	2020-08-14	2020-08-30
316	77	150 000.00 руб	breakfast and lunch	\N	t	2020-08-01	2020-08-30
317	78	80 000.00 руб	all	\N	t	2020-08-01	2020-08-14
318	79	130 000.00 руб	breakfast	\N	t	2020-08-01	2020-08-30
319	80	90 000.00 руб	breakfast and lunch	\N	t	2020-08-01	2020-08-14
320	81	100 000.00 руб	all	\N	t	2020-08-14	2020-08-30
321	2	90 000.00 руб	all	\N	t	2020-09-01	2020-09-14
322	3	140 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-30
323	4	130 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-14
324	5	120 000.00 руб	all	\N	t	2020-09-14	2020-09-30
325	6	120 000.00 руб	all	\N	t	2020-09-01	2020-09-30
326	7	130 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-14
327	8	110 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-30
328	9	120 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-14
329	10	140 000.00 руб	all	\N	t	2020-09-01	2020-09-30
330	11	60 000.00 руб	breakfast	\N	t	2020-09-14	2020-09-30
331	12	70 000.00 руб	breakfast and lunch	\N	t	2020-09-14	2020-09-30
332	13	80 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-30
333	14	60 000.00 руб	all	\N	t	2020-09-01	2020-09-30
334	15	130 000.00 руб	breakfast and lunch	\N	t	2020-09-14	2020-09-30
335	16	60 000.00 руб	all	\N	t	2020-09-01	2020-09-30
336	17	150 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-14
338	19	70 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-14
339	20	80 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-14
340	21	110 000.00 руб	all	\N	t	2020-09-14	2020-09-30
341	22	90 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-30
342	23	60 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-30
343	24	100 000.00 руб	all	\N	t	2020-09-01	2020-09-14
344	25	80 000.00 руб	all	\N	t	2020-09-01	2020-09-14
345	26	150 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-14
346	27	100 000.00 руб	breakfast and lunch	\N	t	2020-09-14	2020-09-30
347	28	50 000.00 руб	breakfast	\N	t	2020-09-14	2020-09-30
349	30	80 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-30
350	31	60 000.00 руб	all	\N	t	2020-09-01	2020-09-14
351	32	60 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-14
352	33	90 000.00 руб	breakfast	\N	t	2020-09-14	2020-09-30
353	34	130 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-30
354	35	100 000.00 руб	all	\N	t	2020-09-01	2020-09-30
355	36	110 000.00 руб	breakfast	\N	t	2020-09-14	2020-09-30
356	37	130 000.00 руб	all	\N	t	2020-09-14	2020-09-30
357	38	150 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-30
358	39	50 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-30
359	40	140 000.00 руб	all	\N	t	2020-09-01	2020-09-30
360	41	70 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-30
361	42	100 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-30
348	29	110 000.00 руб	breakfast	30	t	2020-09-01	2020-09-14
303	64	100 000.00 руб	all	25	t	2020-08-14	2020-08-30
362	43	90 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-14
363	44	80 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-30
364	45	140 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-14
365	46	120 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-30
366	47	130 000.00 руб	all	\N	t	2020-09-01	2020-09-30
367	48	150 000.00 руб	all	\N	t	2020-09-14	2020-09-30
368	49	100 000.00 руб	all	\N	t	2020-09-01	2020-09-30
369	50	90 000.00 руб	breakfast and lunch	\N	t	2020-09-14	2020-09-30
370	51	150 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-14
371	52	110 000.00 руб	all	\N	t	2020-09-01	2020-09-30
372	53	130 000.00 руб	breakfast	\N	t	2020-09-14	2020-09-30
373	54	100 000.00 руб	all	\N	t	2020-09-01	2020-09-30
375	56	50 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-30
376	57	140 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-30
377	58	50 000.00 руб	breakfast and lunch	\N	t	2020-09-14	2020-09-30
378	59	60 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-14
379	60	70 000.00 руб	breakfast and lunch	\N	t	2020-09-14	2020-09-30
380	61	120 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-30
381	62	100 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-14
382	63	60 000.00 руб	breakfast and lunch	\N	t	2020-09-14	2020-09-30
383	64	60 000.00 руб	all	\N	t	2020-09-01	2020-09-30
384	65	150 000.00 руб	all	\N	t	2020-09-01	2020-09-14
385	66	120 000.00 руб	all	\N	t	2020-09-01	2020-09-14
386	67	130 000.00 руб	all	\N	t	2020-09-01	2020-09-30
387	68	50 000.00 руб	all	\N	t	2020-09-14	2020-09-30
388	69	140 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-30
389	70	150 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-30
390	71	80 000.00 руб	all	\N	t	2020-09-01	2020-09-14
391	72	70 000.00 руб	all	\N	t	2020-09-01	2020-09-30
392	73	110 000.00 руб	all	\N	t	2020-09-01	2020-09-14
393	74	140 000.00 руб	breakfast and lunch	\N	t	2020-09-14	2020-09-30
394	75	50 000.00 руб	breakfast	\N	t	2020-09-01	2020-09-30
395	76	90 000.00 руб	all	\N	t	2020-09-01	2020-09-14
396	77	80 000.00 руб	breakfast and lunch	\N	t	2020-09-14	2020-09-30
397	78	90 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-14
398	79	90 000.00 руб	breakfast and lunch	\N	t	2020-09-01	2020-09-30
399	80	80 000.00 руб	all	\N	t	2020-09-01	2020-09-30
400	81	60 000.00 руб	breakfast and lunch	\N	t	2020-09-14	2020-09-30
401	2	90 000.00 руб	breakfast	\N	t	2020-10-01	2020-10-30
402	3	70 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-14
403	4	70 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-30
404	5	60 000.00 руб	breakfast and lunch	\N	t	2020-10-14	2020-10-30
405	6	90 000.00 руб	all	\N	t	2020-10-01	2020-10-30
406	7	150 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-30
407	8	140 000.00 руб	breakfast	\N	t	2020-10-14	2020-10-30
408	9	130 000.00 руб	breakfast	\N	t	2020-10-14	2020-10-30
409	10	70 000.00 руб	all	\N	t	2020-10-01	2020-10-30
410	11	70 000.00 руб	all	\N	t	2020-10-14	2020-10-30
411	12	130 000.00 руб	all	\N	t	2020-10-01	2020-10-30
412	13	110 000.00 руб	breakfast	\N	t	2020-10-01	2020-10-30
413	14	120 000.00 руб	all	\N	t	2020-10-01	2020-10-30
414	15	140 000.00 руб	breakfast	\N	t	2020-10-01	2020-10-14
415	16	50 000.00 руб	all	\N	t	2020-10-01	2020-10-14
416	17	130 000.00 руб	breakfast and lunch	\N	t	2020-10-14	2020-10-30
417	18	50 000.00 руб	all	\N	t	2020-10-01	2020-10-30
418	19	100 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-30
419	20	50 000.00 руб	all	\N	t	2020-10-01	2020-10-30
420	21	70 000.00 руб	breakfast	\N	t	2020-10-01	2020-10-30
421	22	130 000.00 руб	all	\N	t	2020-10-01	2020-10-30
422	23	130 000.00 руб	all	\N	t	2020-10-01	2020-10-14
423	24	80 000.00 руб	all	\N	t	2020-10-14	2020-10-30
424	25	60 000.00 руб	breakfast and lunch	\N	t	2020-10-14	2020-10-30
425	26	50 000.00 руб	all	\N	t	2020-10-01	2020-10-14
426	27	110 000.00 руб	breakfast	\N	t	2020-10-01	2020-10-14
427	28	130 000.00 руб	breakfast	\N	t	2020-10-14	2020-10-30
428	29	90 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-14
429	30	100 000.00 руб	all	\N	t	2020-10-01	2020-10-14
430	31	140 000.00 руб	all	\N	t	2020-10-01	2020-10-30
431	32	100 000.00 руб	all	\N	t	2020-10-14	2020-10-30
432	33	70 000.00 руб	all	\N	t	2020-10-14	2020-10-30
433	34	140 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-30
434	35	50 000.00 руб	all	\N	t	2020-10-01	2020-10-14
435	36	70 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-30
436	37	80 000.00 руб	breakfast	\N	t	2020-10-14	2020-10-30
437	38	60 000.00 руб	breakfast	\N	t	2020-10-01	2020-10-14
438	39	120 000.00 руб	all	\N	t	2020-10-01	2020-10-14
439	40	50 000.00 руб	all	\N	t	2020-10-01	2020-10-30
440	41	70 000.00 руб	all	\N	t	2020-10-01	2020-10-30
441	42	50 000.00 руб	breakfast	\N	t	2020-10-01	2020-10-14
442	43	100 000.00 руб	all	\N	t	2020-10-01	2020-10-30
443	44	130 000.00 руб	all	\N	t	2020-10-01	2020-10-30
445	46	50 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-30
446	47	120 000.00 руб	breakfast	\N	t	2020-10-01	2020-10-30
447	48	140 000.00 руб	all	\N	t	2020-10-01	2020-10-30
448	49	50 000.00 руб	breakfast and lunch	\N	t	2020-10-14	2020-10-30
449	50	60 000.00 руб	all	\N	t	2020-10-01	2020-10-30
450	51	50 000.00 руб	all	\N	t	2020-10-01	2020-10-30
451	52	70 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-14
452	53	50 000.00 руб	all	\N	t	2020-10-01	2020-10-14
453	54	80 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-30
454	55	140 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-30
455	56	60 000.00 руб	all	\N	t	2020-10-01	2020-10-14
456	57	80 000.00 руб	breakfast	\N	t	2020-10-14	2020-10-30
457	58	80 000.00 руб	all	\N	t	2020-10-14	2020-10-30
458	59	90 000.00 руб	breakfast	\N	t	2020-10-14	2020-10-30
459	60	80 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-14
460	61	70 000.00 руб	all	\N	t	2020-10-01	2020-10-14
461	62	130 000.00 руб	breakfast	\N	t	2020-10-01	2020-10-30
462	63	110 000.00 руб	all	\N	t	2020-10-01	2020-10-30
463	64	60 000.00 руб	all	\N	t	2020-10-01	2020-10-14
464	65	80 000.00 руб	all	\N	t	2020-10-14	2020-10-30
465	66	120 000.00 руб	breakfast	\N	t	2020-10-14	2020-10-30
466	67	50 000.00 руб	breakfast	\N	t	2020-10-01	2020-10-14
467	68	90 000.00 руб	breakfast and lunch	\N	t	2020-10-14	2020-10-30
468	69	150 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-30
469	70	150 000.00 руб	all	\N	t	2020-10-01	2020-10-30
470	71	70 000.00 руб	all	\N	t	2020-10-01	2020-10-14
471	72	120 000.00 руб	breakfast	\N	t	2020-10-01	2020-10-30
472	73	90 000.00 руб	breakfast	\N	t	2020-10-14	2020-10-30
473	74	140 000.00 руб	breakfast	\N	t	2020-10-14	2020-10-30
474	75	100 000.00 руб	all	\N	t	2020-10-01	2020-10-14
475	76	90 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-30
476	77	110 000.00 руб	breakfast	\N	t	2020-10-14	2020-10-30
477	78	120 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-30
478	79	140 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-30
479	80	120 000.00 руб	breakfast and lunch	\N	t	2020-10-01	2020-10-14
480	81	90 000.00 руб	all	\N	t	2020-10-01	2020-10-30
481	2	80 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-14
482	3	60 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
374	55	140 000.00 руб	breakfast and lunch	30	t	2020-09-01	2020-09-14
483	4	100 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-14
484	5	120 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
485	6	150 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
486	7	60 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
487	8	150 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
488	9	140 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
489	10	50 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-14
490	11	150 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-30
491	12	150 000.00 руб	all	\N	t	2020-11-14	2020-11-30
492	13	110 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-30
493	14	140 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-14
494	15	130 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-30
495	16	140 000.00 руб	all	\N	t	2020-11-14	2020-11-30
496	17	140 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-30
497	18	60 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
498	19	100 000.00 руб	breakfast and lunch	\N	t	2020-11-14	2020-11-30
499	20	90 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
500	21	50 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-14
501	22	70 000.00 руб	all	\N	t	2020-11-01	2020-11-30
502	23	90 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-30
503	24	120 000.00 руб	breakfast and lunch	\N	t	2020-11-14	2020-11-30
504	25	70 000.00 руб	all	\N	t	2020-11-01	2020-11-14
505	26	120 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-14
506	27	120 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-14
507	28	90 000.00 руб	all	\N	t	2020-11-14	2020-11-30
509	30	150 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
510	31	80 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-30
511	32	50 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-30
512	33	130 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-14
513	34	60 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-14
514	35	110 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
515	36	120 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
516	37	60 000.00 руб	breakfast and lunch	\N	t	2020-11-14	2020-11-30
517	38	140 000.00 руб	all	\N	t	2020-11-14	2020-11-30
518	39	70 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
519	40	100 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
520	41	110 000.00 руб	breakfast and lunch	\N	t	2020-11-14	2020-11-30
521	42	70 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
522	43	120 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
523	44	120 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
524	45	90 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-14
525	46	150 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-14
526	47	130 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
527	48	110 000.00 руб	all	\N	t	2020-11-14	2020-11-30
528	49	80 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
529	50	80 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
530	51	90 000.00 руб	breakfast and lunch	\N	t	2020-11-14	2020-11-30
531	52	100 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-14
532	53	100 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
533	54	50 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
535	56	90 000.00 руб	all	\N	t	2020-11-14	2020-11-30
536	57	90 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
537	58	110 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-14
538	59	150 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
539	60	60 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-14
540	61	60 000.00 руб	all	\N	t	2020-11-14	2020-11-30
541	62	80 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
542	63	120 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-14
543	64	80 000.00 руб	all	\N	t	2020-11-01	2020-11-14
544	65	130 000.00 руб	all	\N	t	2020-11-01	2020-11-30
545	66	50 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
546	67	90 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
547	68	60 000.00 руб	all	\N	t	2020-11-01	2020-11-30
548	69	70 000.00 руб	all	\N	t	2020-11-01	2020-11-30
549	70	70 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-30
550	71	110 000.00 руб	all	\N	t	2020-11-14	2020-11-30
551	72	90 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
552	73	60 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
553	74	60 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-14
554	75	120 000.00 руб	all	\N	t	2020-11-01	2020-11-30
555	76	130 000.00 руб	all	\N	t	2020-11-01	2020-11-14
556	77	90 000.00 руб	breakfast and lunch	\N	t	2020-11-01	2020-11-14
558	79	70 000.00 руб	breakfast	\N	t	2020-11-01	2020-11-30
559	80	100 000.00 руб	breakfast	\N	t	2020-11-14	2020-11-30
560	81	70 000.00 руб	all	\N	t	2020-11-01	2020-11-14
561	2	80 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
562	3	150 000.00 руб	breakfast and lunch	\N	t	2020-12-14	2020-12-30
563	4	100 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
564	5	50 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-30
565	6	130 000.00 руб	all	\N	t	2020-12-01	2020-12-14
566	7	140 000.00 руб	all	\N	t	2020-12-14	2020-12-30
567	8	60 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
568	9	150 000.00 руб	breakfast and lunch	\N	t	2020-12-01	2020-12-14
569	10	140 000.00 руб	breakfast and lunch	\N	t	2020-12-01	2020-12-14
570	11	120 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
571	12	80 000.00 руб	breakfast and lunch	\N	t	2020-12-14	2020-12-30
572	13	50 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
573	14	90 000.00 руб	all	\N	t	2020-12-14	2020-12-30
574	15	60 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-14
575	16	100 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
576	17	140 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
577	18	130 000.00 руб	all	\N	t	2020-12-01	2020-12-30
578	19	70 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
579	20	150 000.00 руб	all	\N	t	2020-12-01	2020-12-30
580	21	120 000.00 руб	breakfast and lunch	\N	t	2020-12-01	2020-12-14
581	22	60 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
582	23	140 000.00 руб	breakfast and lunch	\N	t	2020-12-14	2020-12-30
583	24	100 000.00 руб	all	\N	t	2020-12-01	2020-12-30
584	25	70 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-14
585	26	100 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-30
586	27	60 000.00 руб	all	\N	t	2020-12-14	2020-12-30
587	28	70 000.00 руб	breakfast and lunch	\N	t	2020-12-01	2020-12-14
588	29	110 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-30
589	30	60 000.00 руб	all	\N	t	2020-12-14	2020-12-30
590	31	130 000.00 руб	all	\N	t	2020-12-01	2020-12-14
591	32	130 000.00 руб	all	\N	t	2020-12-14	2020-12-30
593	34	70 000.00 руб	all	\N	t	2020-12-14	2020-12-30
594	35	130 000.00 руб	breakfast and lunch	\N	t	2020-12-14	2020-12-30
595	36	70 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-30
596	37	60 000.00 руб	all	\N	t	2020-12-14	2020-12-30
597	38	60 000.00 руб	breakfast and lunch	\N	t	2020-12-01	2020-12-30
598	39	150 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-14
599	40	90 000.00 руб	breakfast and lunch	\N	t	2020-12-01	2020-12-14
600	41	70 000.00 руб	all	\N	t	2020-12-14	2020-12-30
601	42	120 000.00 руб	all	\N	t	2020-12-01	2020-12-14
602	43	70 000.00 руб	breakfast and lunch	\N	t	2020-12-01	2020-12-14
534	55	150 000.00 руб	all	30	t	2020-11-01	2020-11-30
603	44	130 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-30
605	46	50 000.00 руб	breakfast and lunch	\N	t	2020-12-14	2020-12-30
606	47	70 000.00 руб	all	\N	t	2020-12-01	2020-12-30
607	48	150 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-30
608	49	80 000.00 руб	breakfast and lunch	\N	t	2020-12-14	2020-12-30
609	50	110 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
610	51	60 000.00 руб	all	\N	t	2020-12-01	2020-12-14
611	52	140 000.00 руб	breakfast and lunch	\N	t	2020-12-14	2020-12-30
612	53	150 000.00 руб	breakfast and lunch	\N	t	2020-12-14	2020-12-30
613	54	140 000.00 руб	all	\N	t	2020-12-01	2020-12-14
614	55	140 000.00 руб	all	\N	t	2020-12-14	2020-12-30
615	56	110 000.00 руб	breakfast and lunch	\N	t	2020-12-01	2020-12-14
616	57	130 000.00 руб	all	\N	t	2020-12-01	2020-12-30
617	58	80 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
618	59	140 000.00 руб	breakfast and lunch	\N	t	2020-12-14	2020-12-30
619	60	70 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-30
620	61	140 000.00 руб	breakfast and lunch	\N	t	2020-12-14	2020-12-30
621	62	110 000.00 руб	breakfast and lunch	\N	t	2020-12-01	2020-12-30
622	63	100 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
623	64	60 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
624	65	120 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-30
625	66	90 000.00 руб	all	\N	t	2020-12-14	2020-12-30
626	67	100 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-30
627	68	130 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-30
628	69	150 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-14
629	70	130 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
630	71	90 000.00 руб	breakfast and lunch	\N	t	2020-12-01	2020-12-30
631	72	70 000.00 руб	breakfast and lunch	\N	t	2020-12-01	2020-12-30
632	73	50 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-30
633	74	150 000.00 руб	breakfast and lunch	\N	t	2020-12-01	2020-12-14
634	75	60 000.00 руб	all	\N	t	2020-12-01	2020-12-14
635	76	140 000.00 руб	breakfast	\N	t	2020-12-14	2020-12-30
636	77	140 000.00 руб	breakfast	\N	t	2020-12-01	2020-12-30
637	78	130 000.00 руб	all	\N	t	2020-12-01	2020-12-30
638	79	80 000.00 руб	all	\N	t	2020-12-01	2020-12-30
639	80	80 000.00 руб	all	\N	t	2020-12-01	2020-12-14
640	81	130 000.00 руб	all	\N	t	2020-12-01	2020-12-14
641	2	50 000.00 руб	all	\N	t	2020-04-01	2020-04-30
642	3	150 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-30
643	4	50 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
644	5	100 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
646	7	110 000.00 руб	all	\N	t	2020-04-01	2020-04-14
647	8	50 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-14
648	9	150 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
649	10	140 000.00 руб	breakfast and lunch	\N	t	2020-04-14	2020-04-30
650	11	140 000.00 руб	all	\N	t	2020-04-01	2020-04-14
651	12	90 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-30
652	13	100 000.00 руб	breakfast	\N	t	2020-04-14	2020-04-30
653	14	60 000.00 руб	all	\N	t	2020-04-14	2020-04-30
654	15	130 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-14
655	16	120 000.00 руб	all	\N	t	2020-04-01	2020-04-30
656	17	50 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-14
658	19	130 000.00 руб	all	\N	t	2020-04-14	2020-04-30
659	20	80 000.00 руб	breakfast	\N	t	2020-04-14	2020-04-30
660	21	130 000.00 руб	breakfast and lunch	\N	t	2020-04-14	2020-04-30
661	22	140 000.00 руб	all	\N	t	2020-04-14	2020-04-30
662	23	60 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-14
663	24	50 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-14
664	25	60 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-30
665	26	70 000.00 руб	breakfast	\N	t	2020-04-14	2020-04-30
666	27	150 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
667	28	120 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-14
668	29	120 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
669	30	100 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-30
670	31	120 000.00 руб	breakfast	\N	t	2020-04-14	2020-04-30
671	32	100 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-14
672	33	110 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-14
673	34	80 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-14
674	35	60 000.00 руб	all	\N	t	2020-04-01	2020-04-14
675	36	150 000.00 руб	all	\N	t	2020-04-01	2020-04-30
676	37	100 000.00 руб	all	\N	t	2020-04-01	2020-04-30
677	38	110 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
678	39	110 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-14
679	40	60 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-14
680	41	130 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-14
681	42	110 000.00 руб	all	\N	t	2020-04-14	2020-04-30
682	43	100 000.00 руб	all	\N	t	2020-04-01	2020-04-14
683	44	70 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
684	45	50 000.00 руб	all	\N	t	2020-04-01	2020-04-30
685	46	90 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
686	47	70 000.00 руб	breakfast	\N	t	2020-04-14	2020-04-30
687	48	50 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-14
688	49	150 000.00 руб	breakfast	\N	t	2020-04-14	2020-04-30
689	50	120 000.00 руб	all	\N	t	2020-04-14	2020-04-30
690	51	100 000.00 руб	all	\N	t	2020-04-01	2020-04-14
691	52	130 000.00 руб	all	\N	t	2020-04-01	2020-04-14
692	53	130 000.00 руб	all	\N	t	2020-04-01	2020-04-14
693	54	80 000.00 руб	breakfast	\N	t	2020-04-14	2020-04-30
694	55	90 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-30
695	56	120 000.00 руб	all	\N	t	2020-04-14	2020-04-30
696	57	100 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-14
697	58	120 000.00 руб	all	\N	t	2020-04-14	2020-04-30
698	59	90 000.00 руб	all	\N	t	2020-04-14	2020-04-30
699	60	90 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-30
700	61	130 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
701	62	130 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-30
702	63	60 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
703	64	70 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-30
704	65	70 000.00 руб	breakfast and lunch	\N	t	2020-04-14	2020-04-30
705	66	90 000.00 руб	all	\N	t	2020-04-01	2020-04-14
706	67	150 000.00 руб	all	\N	t	2020-04-01	2020-04-14
707	68	120 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
708	69	50 000.00 руб	breakfast	\N	t	2020-04-14	2020-04-30
709	70	120 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
710	71	80 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-30
711	72	110 000.00 руб	breakfast and lunch	\N	t	2020-04-01	2020-04-30
712	73	50 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-14
713	74	110 000.00 руб	all	\N	t	2020-04-01	2020-04-30
714	75	130 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-14
715	76	110 000.00 руб	all	\N	t	2020-04-01	2020-04-14
716	77	90 000.00 руб	breakfast	\N	t	2020-04-14	2020-04-30
717	78	80 000.00 руб	all	\N	t	2020-04-01	2020-04-30
718	79	60 000.00 руб	all	\N	t	2020-04-14	2020-04-30
719	80	80 000.00 руб	breakfast	\N	t	2020-04-01	2020-04-30
720	81	70 000.00 руб	breakfast and lunch	\N	t	2020-04-14	2020-04-30
721	2	70 000.00 руб	all	\N	t	2020-03-01	2020-03-30
722	3	60 000.00 руб	breakfast and lunch	\N	t	2020-03-01	2020-03-14
657	18	130 000.00 руб	all	25	t	2020-04-01	2020-04-14
604	45	140 000.00 руб	breakfast	15	t	2020-12-01	2020-12-14
723	4	120 000.00 руб	breakfast and lunch	\N	t	2020-03-01	2020-03-14
724	5	50 000.00 руб	all	\N	t	2020-03-14	2020-03-30
725	6	60 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-14
726	7	70 000.00 руб	all	\N	t	2020-03-14	2020-03-30
727	8	100 000.00 руб	all	\N	t	2020-03-01	2020-03-14
728	9	140 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-30
729	10	110 000.00 руб	all	\N	t	2020-03-14	2020-03-30
730	11	110 000.00 руб	breakfast	\N	t	2020-03-14	2020-03-30
731	12	110 000.00 руб	all	\N	t	2020-03-14	2020-03-30
732	13	140 000.00 руб	all	\N	t	2020-03-01	2020-03-30
733	14	130 000.00 руб	all	\N	t	2020-03-01	2020-03-14
734	15	130 000.00 руб	all	\N	t	2020-03-14	2020-03-30
735	16	150 000.00 руб	all	\N	t	2020-03-01	2020-03-14
736	17	130 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
737	18	80 000.00 руб	all	\N	t	2020-03-14	2020-03-30
738	19	50 000.00 руб	all	\N	t	2020-03-01	2020-03-30
739	20	150 000.00 руб	breakfast	\N	t	2020-03-14	2020-03-30
740	21	50 000.00 руб	all	\N	t	2020-03-01	2020-03-14
741	22	70 000.00 руб	breakfast and lunch	\N	t	2020-03-01	2020-03-14
742	23	100 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
743	24	130 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
744	25	50 000.00 руб	all	\N	t	2020-03-14	2020-03-30
745	26	90 000.00 руб	breakfast and lunch	\N	t	2020-03-01	2020-03-14
746	27	60 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-14
747	28	110 000.00 руб	breakfast	\N	t	2020-03-14	2020-03-30
748	29	110 000.00 руб	all	\N	t	2020-03-14	2020-03-30
750	31	100 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
751	32	110 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-30
753	34	90 000.00 руб	all	\N	t	2020-03-01	2020-03-30
754	35	70 000.00 руб	all	\N	t	2020-03-01	2020-03-14
755	36	150 000.00 руб	all	\N	t	2020-03-01	2020-03-30
756	37	70 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
757	38	60 000.00 руб	all	\N	t	2020-03-01	2020-03-30
758	39	140 000.00 руб	all	\N	t	2020-03-14	2020-03-30
759	40	120 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-30
760	41	130 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-14
761	42	80 000.00 руб	all	\N	t	2020-03-01	2020-03-30
762	43	90 000.00 руб	all	\N	t	2020-03-01	2020-03-14
763	44	110 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-30
764	45	110 000.00 руб	breakfast and lunch	\N	t	2020-03-01	2020-03-30
765	46	100 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-30
766	47	80 000.00 руб	all	\N	t	2020-03-01	2020-03-30
767	48	150 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
768	49	150 000.00 руб	breakfast and lunch	\N	t	2020-03-01	2020-03-14
769	50	120 000.00 руб	all	\N	t	2020-03-01	2020-03-30
770	51	90 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
771	52	100 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
772	53	120 000.00 руб	all	\N	t	2020-03-14	2020-03-30
773	54	150 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
774	55	120 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
775	56	140 000.00 руб	all	\N	t	2020-03-14	2020-03-30
776	57	50 000.00 руб	breakfast	\N	t	2020-03-14	2020-03-30
777	58	140 000.00 руб	all	\N	t	2020-03-01	2020-03-30
778	59	90 000.00 руб	all	\N	t	2020-03-01	2020-03-14
779	60	140 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-14
780	61	130 000.00 руб	all	\N	t	2020-03-01	2020-03-30
781	62	50 000.00 руб	breakfast	\N	t	2020-03-14	2020-03-30
782	63	110 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-30
783	64	80 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-30
784	65	90 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
785	66	50 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-30
786	67	50 000.00 руб	breakfast and lunch	\N	t	2020-03-01	2020-03-14
787	68	70 000.00 руб	breakfast	\N	t	2020-03-14	2020-03-30
788	69	120 000.00 руб	breakfast	\N	t	2020-03-14	2020-03-30
789	70	130 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-30
790	71	100 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-30
791	72	150 000.00 руб	all	\N	t	2020-03-14	2020-03-30
792	73	120 000.00 руб	breakfast and lunch	\N	t	2020-03-01	2020-03-30
793	74	140 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-30
794	75	50 000.00 руб	breakfast	\N	t	2020-03-14	2020-03-30
795	76	150 000.00 руб	all	\N	t	2020-03-01	2020-03-14
796	77	120 000.00 руб	all	\N	t	2020-03-01	2020-03-14
798	79	80 000.00 руб	breakfast	\N	t	2020-03-01	2020-03-14
799	80	70 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
800	81	140 000.00 руб	breakfast and lunch	\N	t	2020-03-14	2020-03-30
801	2	60 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-14
802	2	110 000.00 руб	all	\N	t	2020-02-01	2020-02-14
803	3	50 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-29
804	4	90 000.00 руб	breakfast	\N	t	2020-02-14	2020-02-29
805	5	120 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-14
806	6	50 000.00 руб	all	\N	t	2020-02-01	2020-02-14
807	7	90 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-29
808	8	110 000.00 руб	all	\N	t	2020-02-01	2020-02-14
809	9	80 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-29
810	10	50 000.00 руб	all	\N	t	2020-02-01	2020-02-29
811	11	90 000.00 руб	all	\N	t	2020-02-01	2020-02-29
812	12	150 000.00 руб	breakfast and lunch	\N	t	2020-02-14	2020-02-29
813	13	120 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-14
814	14	140 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-14
815	15	140 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-29
816	16	120 000.00 руб	breakfast	\N	t	2020-02-14	2020-02-29
817	17	60 000.00 руб	breakfast	\N	t	2020-02-14	2020-02-29
818	18	110 000.00 руб	breakfast and lunch	\N	t	2020-02-14	2020-02-29
819	19	110 000.00 руб	all	\N	t	2020-02-01	2020-02-14
820	20	60 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-29
821	21	90 000.00 руб	breakfast and lunch	\N	t	2020-02-14	2020-02-29
822	22	80 000.00 руб	all	\N	t	2020-02-14	2020-02-29
823	23	50 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-14
824	24	90 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-29
825	25	90 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-29
826	26	140 000.00 руб	all	\N	t	2020-02-01	2020-02-29
827	27	80 000.00 руб	all	\N	t	2020-02-01	2020-02-14
828	28	70 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-14
829	29	50 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-14
830	30	110 000.00 руб	breakfast and lunch	\N	t	2020-02-14	2020-02-29
831	31	130 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-29
832	32	150 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-29
834	34	140 000.00 руб	breakfast and lunch	\N	t	2020-02-14	2020-02-29
835	35	130 000.00 руб	all	\N	t	2020-02-14	2020-02-29
836	36	90 000.00 руб	breakfast	\N	t	2020-02-14	2020-02-29
837	37	80 000.00 руб	all	\N	t	2020-02-01	2020-02-29
838	38	80 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-29
839	39	140 000.00 руб	breakfast and lunch	\N	t	2020-02-14	2020-02-29
840	40	150 000.00 руб	all	\N	t	2020-02-14	2020-02-29
841	41	80 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-29
842	42	130 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-29
749	30	80 000.00 руб	breakfast	30	t	2020-03-01	2020-03-14
797	78	150 000.00 руб	breakfast and lunch	30	t	2020-03-14	2020-03-30
843	43	60 000.00 руб	breakfast and lunch	\N	t	2020-02-14	2020-02-29
844	44	70 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-29
845	45	80 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-14
846	46	50 000.00 руб	breakfast and lunch	\N	t	2020-02-14	2020-02-29
847	47	110 000.00 руб	all	\N	t	2020-02-01	2020-02-29
848	48	150 000.00 руб	all	\N	t	2020-02-01	2020-02-29
849	49	150 000.00 руб	breakfast	\N	t	2020-02-14	2020-02-29
850	50	70 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-29
851	51	130 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-29
852	52	130 000.00 руб	all	\N	t	2020-02-01	2020-02-14
853	53	100 000.00 руб	breakfast	\N	t	2020-02-14	2020-02-29
854	54	150 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-14
855	55	70 000.00 руб	all	\N	t	2020-02-14	2020-02-29
856	56	100 000.00 руб	all	\N	t	2020-02-01	2020-02-14
857	57	110 000.00 руб	all	\N	t	2020-02-01	2020-02-29
858	58	70 000.00 руб	breakfast and lunch	\N	t	2020-02-14	2020-02-29
859	59	90 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-14
860	60	130 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-14
861	61	140 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-29
862	62	90 000.00 руб	all	\N	t	2020-02-01	2020-02-29
863	63	140 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-14
864	64	50 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-14
865	65	90 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-29
866	66	80 000.00 руб	breakfast and lunch	\N	t	2020-02-14	2020-02-29
867	67	60 000.00 руб	breakfast	\N	t	2020-02-14	2020-02-29
868	68	70 000.00 руб	breakfast and lunch	\N	t	2020-02-14	2020-02-29
869	69	120 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-14
870	70	70 000.00 руб	all	\N	t	2020-02-14	2020-02-29
871	71	120 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-14
872	72	90 000.00 руб	all	\N	t	2020-02-14	2020-02-29
873	73	150 000.00 руб	all	\N	t	2020-02-14	2020-02-29
874	74	90 000.00 руб	all	\N	t	2020-02-01	2020-02-29
875	75	110 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-29
876	76	60 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-14
877	77	120 000.00 руб	breakfast	\N	t	2020-02-14	2020-02-29
878	78	60 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-29
879	79	150 000.00 руб	breakfast	\N	t	2020-02-01	2020-02-29
880	80	120 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-14
881	81	140 000.00 руб	breakfast and lunch	\N	t	2020-02-01	2020-02-29
882	2	50 000.00 руб	breakfast and lunch	\N	t	2020-01-01	2020-01-14
883	3	80 000.00 руб	breakfast and lunch	\N	t	2020-01-14	2020-01-29
884	4	130 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
885	5	90 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-14
886	6	70 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
887	7	130 000.00 руб	breakfast and lunch	\N	t	2020-01-01	2020-01-14
888	8	70 000.00 руб	all	\N	t	2020-01-01	2020-01-29
889	9	80 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
890	10	90 000.00 руб	breakfast	\N	t	2020-01-14	2020-01-29
891	11	70 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-14
892	12	100 000.00 руб	all	\N	t	2020-01-01	2020-01-14
893	13	130 000.00 руб	all	\N	t	2020-01-01	2020-01-14
894	14	70 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-14
895	15	130 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-14
896	16	150 000.00 руб	all	\N	t	2020-01-01	2020-01-14
897	17	150 000.00 руб	breakfast and lunch	\N	t	2020-01-01	2020-01-14
898	18	80 000.00 руб	all	\N	t	2020-01-01	2020-01-29
899	19	110 000.00 руб	breakfast and lunch	\N	t	2020-01-14	2020-01-29
900	20	150 000.00 руб	breakfast	\N	t	2020-01-14	2020-01-29
901	21	80 000.00 руб	breakfast	\N	t	2020-01-14	2020-01-29
902	22	140 000.00 руб	breakfast and lunch	\N	t	2020-01-14	2020-01-29
903	23	100 000.00 руб	breakfast	\N	t	2020-01-14	2020-01-29
904	24	150 000.00 руб	breakfast	\N	t	2020-01-14	2020-01-29
905	25	110 000.00 руб	all	\N	t	2020-01-14	2020-01-29
906	26	100 000.00 руб	breakfast	\N	t	2020-01-14	2020-01-29
907	27	60 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-14
908	28	90 000.00 руб	breakfast and lunch	\N	t	2020-01-01	2020-01-14
909	29	80 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
910	30	50 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-14
911	31	110 000.00 руб	breakfast	\N	t	2020-01-14	2020-01-29
912	32	130 000.00 руб	all	\N	t	2020-01-14	2020-01-29
914	34	120 000.00 руб	breakfast	\N	t	2020-01-14	2020-01-29
915	35	110 000.00 руб	all	\N	t	2020-01-01	2020-01-29
916	36	60 000.00 руб	all	\N	t	2020-01-14	2020-01-29
917	37	140 000.00 руб	breakfast and lunch	\N	t	2020-01-01	2020-01-14
918	38	70 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
919	39	50 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
920	40	150 000.00 руб	all	\N	t	2020-01-01	2020-01-14
921	41	140 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
922	42	110 000.00 руб	breakfast and lunch	\N	t	2020-01-01	2020-01-14
923	43	130 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-14
924	44	90 000.00 руб	breakfast and lunch	\N	t	2020-01-01	2020-01-14
926	46	130 000.00 руб	breakfast and lunch	\N	t	2020-01-14	2020-01-29
927	47	130 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
928	48	140 000.00 руб	breakfast and lunch	\N	t	2020-01-01	2020-01-14
929	49	100 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
930	50	70 000.00 руб	breakfast and lunch	\N	t	2020-01-14	2020-01-29
931	51	120 000.00 руб	all	\N	t	2020-01-14	2020-01-29
932	52	70 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
933	53	60 000.00 руб	breakfast and lunch	\N	t	2020-01-01	2020-01-29
934	54	60 000.00 руб	breakfast and lunch	\N	t	2020-01-14	2020-01-29
936	56	150 000.00 руб	all	\N	t	2020-01-01	2020-01-29
937	57	80 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
938	58	150 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-14
939	59	110 000.00 руб	breakfast and lunch	\N	t	2020-01-01	2020-01-14
940	60	120 000.00 руб	all	\N	t	2020-01-01	2020-01-29
941	61	140 000.00 руб	all	\N	t	2020-01-14	2020-01-29
942	62	90 000.00 руб	breakfast	\N	t	2020-01-14	2020-01-29
943	63	110 000.00 руб	breakfast	\N	t	2020-01-14	2020-01-29
945	65	130 000.00 руб	all	\N	t	2020-01-14	2020-01-29
946	66	80 000.00 руб	all	\N	t	2020-01-14	2020-01-29
947	67	70 000.00 руб	breakfast and lunch	\N	t	2020-01-14	2020-01-29
948	68	110 000.00 руб	all	\N	t	2020-01-01	2020-01-14
949	69	90 000.00 руб	breakfast and lunch	\N	t	2020-01-14	2020-01-29
950	70	70 000.00 руб	breakfast and lunch	\N	t	2020-01-14	2020-01-29
951	71	50 000.00 руб	breakfast and lunch	\N	t	2020-01-01	2020-01-29
952	72	120 000.00 руб	breakfast and lunch	\N	t	2020-01-14	2020-01-29
953	73	120 000.00 руб	all	\N	t	2020-01-01	2020-01-14
954	74	150 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-14
955	75	120 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
956	76	150 000.00 руб	all	\N	t	2020-01-14	2020-01-29
957	77	50 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
958	78	60 000.00 руб	breakfast	\N	t	2020-01-14	2020-01-29
959	79	100 000.00 руб	breakfast	\N	t	2020-01-01	2020-01-29
960	80	120 000.00 руб	breakfast and lunch	\N	t	2020-01-14	2020-01-29
961	81	150 000.00 руб	breakfast and lunch	\N	t	2020-01-14	2020-01-29
925	45	120 000.00 руб	breakfast	15	t	2020-01-14	2020-01-29
913	33	150 000.00 руб	all	45	t	2020-01-01	2020-01-14
935	55	150 000.00 руб	breakfast	30	t	2020-01-01	2020-01-29
5	6	120 000.00 руб	all	20	t	2020-05-01	2020-05-14
85	6	90 000.00 руб	all	20	t	2020-06-14	2020-06-30
165	6	150 000.00 руб	all	20	t	2020-07-14	2020-07-30
645	6	140 000.00 руб	breakfast	20	t	2020-04-01	2020-04-30
337	18	100 000.00 руб	breakfast	25	t	2020-09-01	2020-09-14
143	64	100 000.00 руб	breakfast and lunch	25	t	2020-06-01	2020-06-30
944	64	130 000.00 руб	breakfast and lunch	25	t	2020-01-14	2020-01-29
444	45	130 000.00 руб	breakfast and lunch	15	t	2020-10-01	2020-10-30
592	33	150 000.00 руб	all	45	t	2020-12-01	2020-12-14
752	33	150 000.00 руб	breakfast	45	t	2020-03-14	2020-03-30
833	33	140 000.00 руб	breakfast	45	t	2020-02-01	2020-02-14
237	78	150 000.00 руб	all	30	t	2020-07-01	2020-07-14
508	29	150 000.00 руб	breakfast and lunch	30	t	2020-11-14	2020-11-30
557	78	150 000.00 руб	breakfast and lunch	30	t	2020-11-01	2020-11-30
\.


--
-- Name: tur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yii_user
--

SELECT pg_catalog.setval('public.tur_id_seq', 961, true);


--
-- Name: city_pkey; Type: CONSTRAINT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: country_pkey; Type: CONSTRAINT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id);


--
-- Name: tur_pkey; Type: CONSTRAINT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.tur
    ADD CONSTRAINT tur_pkey PRIMARY KEY (id);


--
-- Name: city_id_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_id_country_fkey FOREIGN KEY (id_country) REFERENCES public.country(id);


--
-- Name: hotel_id_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_id_city_fkey FOREIGN KEY (id_city) REFERENCES public.city(id);


--
-- Name: hotel_id_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_id_country_fkey FOREIGN KEY (id_country) REFERENCES public.country(id);


--
-- Name: image_id_hotel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_id_hotel_fkey FOREIGN KEY (id_hotel) REFERENCES public.hotel(id);


--
-- Name: tur_id_hotel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yii_user
--

ALTER TABLE ONLY public.tur
    ADD CONSTRAINT tur_id_hotel_fkey FOREIGN KEY (id_hotel) REFERENCES public.hotel(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

