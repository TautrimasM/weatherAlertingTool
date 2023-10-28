--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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
-- Name: gpsdata; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.gpsdata (
    id integer NOT NULL,
    truckid character varying(255),
    "timestamp" timestamp with time zone,
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.gpsdata OWNER TO root;

--
-- Name: gpsdata_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.gpsdata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gpsdata_id_seq OWNER TO root;

--
-- Name: gpsdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.gpsdata_id_seq OWNED BY public.gpsdata.id;


--
-- Name: trucks; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.trucks (
    id integer NOT NULL,
    truckid character varying(255),
    drivername character varying(255),
    driveremail character varying(255),
    "timestamp" timestamp with time zone
);


ALTER TABLE public.trucks OWNER TO root;

--
-- Name: trucks_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.trucks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trucks_id_seq OWNER TO root;

--
-- Name: trucks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.trucks_id_seq OWNED BY public.trucks.id;


--
-- Name: gpsdata id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.gpsdata ALTER COLUMN id SET DEFAULT nextval('public.gpsdata_id_seq'::regclass);


--
-- Name: trucks id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.trucks ALTER COLUMN id SET DEFAULT nextval('public.trucks_id_seq'::regclass);


--
-- Data for Name: gpsdata; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.gpsdata (id, truckid, "timestamp", latitude, longitude) FROM stdin;
530	Truck1	2023-10-28 03:47:36.396503+00	40.7128	-74.006
531	Truck1	2023-10-28 03:47:41.396503+00	40.713	-74.0062
532	Truck1	2023-10-28 03:47:46.396503+00	40.7132	-74.0064
533	Truck2	2023-10-28 03:47:36.396503+00	34.0522	-118.2437
534	Truck2	2023-10-28 03:47:41.396503+00	34.0524	-118.2439
535	Truck2	2023-10-28 03:47:46.396503+00	34.0526	-118.2441
536	Truck3	2023-10-28 03:47:36.396503+00	41.8781	-87.6298
537	Truck3	2023-10-28 03:47:41.396503+00	41.8783	-87.63
538	Truck3	2023-10-28 03:47:46.396503+00	41.8785	-87.6302
539	Truck4	2023-10-28 03:47:36.396503+00	29.7604	-95.3698
540	Truck4	2023-10-28 03:47:41.396503+00	29.7606	-95.37
541	Truck4	2023-10-28 03:47:46.396503+00	29.7608	-95.3702
542	Truck5	2023-10-28 03:47:36.396503+00	25.7617	-80.1918
543	Truck5	2023-10-28 03:47:41.396503+00	25.7619	-80.192
544	Truck5	2023-10-28 03:47:46.396503+00	25.7621	-80.1922
545	Truck6	2023-10-28 03:47:36.396503+00	47.6062	-122.3321
546	Truck6	2023-10-28 03:47:41.396503+00	47.6064	-122.3323
547	Truck6	2023-10-28 03:47:46.396503+00	47.6066	-122.3325
548	Truck7	2023-10-28 03:47:36.396503+00	39.7392	-104.9903
549	Truck7	2023-10-28 03:47:41.396503+00	39.7394	-104.9905
550	Truck7	2023-10-28 03:47:46.396503+00	39.7396	-104.9907
551	Truck8	2023-10-28 03:47:36.396503+00	36.1699	-115.1398
552	Truck8	2023-10-28 03:47:41.396503+00	36.1701	-115.14
553	Truck8	2023-10-28 03:47:46.396503+00	36.1703	-115.1402
554	Truck9	2023-10-28 03:47:36.396503+00	42.3601	-71.0589
555	Truck9	2023-10-28 03:47:41.396503+00	42.3603	-71.0591
556	Truck9	2023-10-28 03:47:46.396503+00	42.3605	-71.0593
557	Truck10	2023-10-28 03:47:36.396503+00	37.7749	-122.4194
558	Truck10	2023-10-28 03:47:41.396503+00	37.7751	-122.4196
559	Truck10	2023-10-28 03:47:46.396503+00	37.7753	-122.4198
560	Truck11	2023-10-28 03:47:36.396503+00	33.4484	-112.074
561	Truck11	2023-10-28 03:47:41.396503+00	33.4486	-112.0742
562	Truck11	2023-10-28 03:47:46.396503+00	33.4488	-112.0744
563	Truck12	2023-10-28 03:47:36.396503+00	39.9526	-75.1652
564	Truck12	2023-10-28 03:47:41.396503+00	39.9528	-75.1654
565	Truck12	2023-10-28 03:47:46.396503+00	39.953	-75.1656
566	Truck13	2023-10-28 03:47:36.396503+00	32.7157	-117.1611
567	Truck13	2023-10-28 03:47:41.396503+00	32.7159	-117.1613
568	Truck13	2023-10-28 03:47:46.396503+00	32.7161	-117.1615
569	Truck14	2023-10-28 03:47:36.396503+00	32.7767	-96.797
570	Truck14	2023-10-28 03:47:41.396503+00	32.7769	-96.7972
571	Truck14	2023-10-28 03:47:46.396503+00	32.7771	-96.7974
572	Truck15	2023-10-28 03:47:36.396503+00	33.749	-84.3879
573	Truck15	2023-10-28 03:47:41.396503+00	33.7492	-84.3881
574	Truck15	2023-10-28 03:47:46.396503+00	33.7494	-84.3883
575	Truck16	2023-10-28 03:47:36.396503+00	38.8951	-77.0369
576	Truck16	2023-10-28 03:47:41.396503+00	38.8953	-77.0371
577	Truck16	2023-10-28 03:47:46.396503+00	38.8955	-77.0373
578	Truck17	2023-10-28 03:47:36.396503+00	44.9778	-93.265
579	Truck17	2023-10-28 03:47:41.396503+00	44.978	-93.2652
580	Truck17	2023-10-28 03:47:46.396503+00	44.9782	-93.2654
581	Truck18	2023-10-28 03:47:36.396503+00	29.9511	-90.0715
582	Truck18	2023-10-28 03:47:41.396503+00	29.9513	-90.0717
583	Truck18	2023-10-28 03:47:46.396503+00	29.9515	-90.0719
584	Truck19	2023-10-28 03:47:36.396503+00	42.3314	-83.0458
585	Truck19	2023-10-28 03:47:41.396503+00	42.3316	-83.046
586	Truck19	2023-10-28 03:47:46.396503+00	42.3318	-83.0462
587	Truck20	2023-10-28 03:47:36.396503+00	45.5051	-122.675
588	Truck20	2023-10-28 03:47:41.396503+00	45.5053	-122.6752
589	Truck20	2023-10-28 03:47:46.396503+00	45.5055	-122.6754
\.


--
-- Data for Name: trucks; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.trucks (id, truckid, drivername, driveremail, "timestamp") FROM stdin;
84	Truck1	Driver1	driver1@example.com	2023-10-28 03:45:09.238987+00
85	Truck2	Driver2	driver2@example.com	2023-10-28 03:45:09.238987+00
86	Truck3	Driver3	driver3@example.com	2023-10-28 03:45:09.238987+00
87	Truck4	Driver4	driver4@example.com	2023-10-28 03:45:09.238987+00
88	Truck5	Driver5	driver5@example.com	2023-10-28 03:45:09.238987+00
89	Truck6	Driver6	driver6@example.com	2023-10-28 03:45:09.238987+00
90	Truck7	Driver7	driver7@example.com	2023-10-28 03:45:09.238987+00
91	Truck8	Driver8	driver8@example.com	2023-10-28 03:45:09.238987+00
92	Truck9	Driver9	driver9@example.com	2023-10-28 03:45:09.238987+00
93	Truck10	Driver10	driver10@example.com	2023-10-28 03:45:09.238987+00
94	Truck11	Driver11	driver11@example.com	2023-10-28 03:45:09.238987+00
95	Truck12	Driver12	driver12@example.com	2023-10-28 03:45:09.238987+00
96	Truck13	Driver13	driver13@example.com	2023-10-28 03:45:09.238987+00
97	Truck14	Driver14	driver14@example.com	2023-10-28 03:45:09.238987+00
98	Truck15	Driver15	driver15@example.com	2023-10-28 03:45:09.238987+00
99	Truck16	Driver16	driver16@example.com	2023-10-28 03:45:09.238987+00
100	Truck17	Driver17	driver17@example.com	2023-10-28 03:45:09.238987+00
101	Truck18	Driver18	driver18@example.com	2023-10-28 03:45:09.238987+00
102	Truck19	Driver19	driver19@example.com	2023-10-28 03:45:09.238987+00
103	Truck20	Driver20	driver20@example.com	2023-10-28 03:45:09.238987+00
\.


--
-- Name: gpsdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.gpsdata_id_seq', 589, true);


--
-- Name: trucks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.trucks_id_seq', 103, true);


--
-- Name: gpsdata gpsdata_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.gpsdata
    ADD CONSTRAINT gpsdata_pkey PRIMARY KEY (id);


--
-- Name: trucks trucks_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.trucks
    ADD CONSTRAINT trucks_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

