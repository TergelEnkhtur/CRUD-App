--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: crud_library; Type: TABLE; Schema: public; Owner: api_user
--

CREATE TABLE public.crud_library (
    isbn character(13) NOT NULL,
    book_name character varying(50) NOT NULL,
    author_name character varying(50) NOT NULL
);



--
-- Name: team_members; Type: TABLE; Schema: public; Owner: api_user
--

CREATE TABLE public.team_members (
    id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30)
);



--
-- Name: team_members_id_seq; Type: SEQUENCE; Schema: public; Owner: api_user
--

CREATE SEQUENCE public.team_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: team_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: api_user
--

ALTER SEQUENCE public.team_members_id_seq OWNED BY public.team_members.id;


--
-- Name: team_members id; Type: DEFAULT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.team_members ALTER COLUMN id SET DEFAULT nextval('public.team_members_id_seq'::regclass);


--
-- Data for Name: crud_library; Type: TABLE DATA; Schema: public; Owner: api_user
--

COPY public.crud_library (isbn, book_name, author_name) FROM stdin;
123456789123 	Harry Potter and the Prisoner of Azkaban	J.K. Rowling
\.


--
-- Data for Name: team_members; Type: TABLE DATA; Schema: public; Owner: api_user
--

COPY public.team_members (id, first_name, last_name) FROM stdin;
1	Tergel	Enkhtur
2	Brandon	Rosas
3	Cooper	Ross
4	Zaeem	Khan
5	Henry	Holman
6	Hinal	Patel
7	Tergel	Enkhtur
8	Naruto	Uzumaki
9	Saruul	Enkhtur
10	First	Last
11	FirstName	LastName
12	First1	Last1
13	1234567891233	Harry
\.


--
-- Name: team_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: api_user
--

SELECT pg_catalog.setval('public.team_members_id_seq', 13, true);


--
-- Name: crud_library crud_library_pkey; Type: CONSTRAINT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.crud_library
    ADD CONSTRAINT crud_library_pkey PRIMARY KEY (isbn);


--
-- Name: team_members team_members_pkey; Type: CONSTRAINT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

CREATE TABLE public.book (
    isbn character(13) NOT NULL,
        book_name character varying(50) NOT NULL,
	    author_name character varying(50) NOT NULL
	    );


--
-- Name: library; Type: TABLE; Schema: public; Owner: api_user
--

CREATE TABLE public.library (
    user_catg character varying(30),
        userid integer NOT NULL
	);


--
-- Name: library_userid_seq; Type: SEQUENCE; Schema: public; Owner: api_user
--

CREATE SEQUENCE public.library_userid_seq
    AS integer
        START WITH 1
	    INCREMENT BY 1
	        NO MINVALUE
		    NO MAXVALUE
		        CACHE 1;


--
-- Name: library_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: api_user
--

ALTER SEQUENCE public.library_userid_seq OWNED BY public.library.userid; -- leave


--
-- Name: team_members; Type: TABLE; Schema: public; Owner: api_user
--

CREATE TABLE public.team_members (
    id integer NOT NULL,
        first_name character varying(30),
	    last_name character varying(30)
	    );



--
-- Name: team_members_id_seq; Type: SEQUENCE; Schema: public; Owner: api_user
--

CREATE SEQUENCE public.team_members_id_seq
    AS integer
        START WITH 1
	    INCREMENT BY 1
	        NO MINVALUE
		    NO MAXVALUE
		        CACHE 1;



--
-- Name: team_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: api_user
--

ALTER SEQUENCE public.team_members_id_seq OWNED BY public.team_members.id;


--
-- Name: user_l; Type: TABLE; Schema: public; Owner: api_user
--

CREATE TABLE public.user_l (
    username character varying(20) NOT NULL,
        password character varying(25) NOT NULL,
	    userrole character varying(25) NOT NULL,
	        userid integer NOT NULL
		);



--
-- Name: library userid; Type: DEFAULT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.library ALTER COLUMN userid SET DEFAULT nextval('public.library_userid_seq'::regclass);


--
-- Name: team_members id; Type: DEFAULT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.team_members ALTER COLUMN id SET DEFAULT nextval('public.team_members_id_seq'::regclass);


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: hinalpatel
--

COPY public.book (isbn, book_name, author_name) FROM stdin;
-12          	 coding	coder
\.


--
-- Data for Name: library; Type: TABLE DATA; Schema: public; Owner: api_user
--

COPY public.library (user_catg, userid) FROM stdin;
NEWUSER		    1
\.


--
-- Data for Name: team_members; Type: TABLE DATA; Schema: public; Owner: api_user
--

COPY public.team_members (id, first_name, last_name) FROM stdin;
1    Hinal		 Patel
2    Zaeem		 Khan
3    Henry		 Holman
4    Tergel		 Enkhtur
5    Brandon		 Rosas
6    Cooper		 Ross
7
\.


--
-- Data for Name: user_l; Type: TABLE DATA; Schema: public; Owner: api_user
--

COPY public.user_l (username, password, userrole, userid) FROM stdin;
K_P  K_P	   librarian  2
\.


--
-- Name: library_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: api_user
--

SELECT pg_catalog.setval('public.library_userid_seq', 1, true);


--
-- Name: team_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: api_user
--

SELECT pg_catalog.setval('public.team_members_id_seq', 7, true);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: hinalpatel
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (isbn);


--
-- Name: library library_pkey; Type: CONSTRAINT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.library
    ADD CONSTRAINT library_pkey PRIMARY KEY (userid);


--
-- Name: team_members team_members_pkey; Type: CONSTRAINT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
