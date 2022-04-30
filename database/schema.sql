--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1252';
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
    id integer NOT NULL,
    book_title character varying(50),
    author_name character varying(50),
    isbn character(17)
);


-- ALTER TABLE public.crud_library OWNER TO api_user;

--
-- Name: crud_library_id_seq; Type: SEQUENCE; Schema: public; Owner: api_user
--

CREATE SEQUENCE public.crud_library_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE public.crud_library_id_seq OWNER TO api_user;

--
-- Name: crud_library_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: api_user
--

ALTER SEQUENCE public.crud_library_id_seq OWNED BY public.crud_library.id;


--
-- Name: crud_user; Type: TABLE; Schema: public; Owner: api_user
--

CREATE TABLE public.crud_user (
    id integer NOT NULL,
    username character varying(25) NOT NULL,
    password character varying(25) NOT NULL,
    repassword character varying(25) NOT NULL,
    userrole character varying(10) NOT NULL
);


-- ALTER TABLE public.crud_user OWNER TO api_user;

--
-- Name: crud_user_id_seq; Type: SEQUENCE; Schema: public; Owner: api_user
--

CREATE SEQUENCE public.crud_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE public.crud_user_id_seq OWNER TO api_user;

--
-- Name: crud_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: api_user
--

ALTER SEQUENCE public.crud_user_id_seq OWNED BY public.crud_user.id;



--
-- Name: crud_library id; Type: DEFAULT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.crud_library ALTER COLUMN id SET DEFAULT nextval('public.crud_library_id_seq'::regclass);


--
-- Name: crud_user id; Type: DEFAULT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.crud_user ALTER COLUMN id SET DEFAULT nextval('public.crud_user_id_seq'::regclass);



--
-- Data for Name: crud_library; Type: TABLE DATA; Schema: public; Owner: api_user
--

COPY public.crud_library (id, book_title, author_name, isbn) FROM stdin;
1	Harry Potter and the Prisoner of Azkaban	J.K. Rowling	978-0-545582-93-3
2	How To Train Your Dragon	Cressida Cowell	978-0-316085-27-4
\.


--
-- Data for Name: crud_user; Type: TABLE DATA; Schema: public; Owner: api_user
--

COPY public.crud_user (id, username, password, repassword, userrole) FROM stdin;
1	RonWeasley	Scabbers	Scabbers	admin
2	HarryPotter	Nimbus2000	Nimbus2000	admin
\.



--
-- Name: crud_library_id_seq; Type: SEQUENCE SET; Schema: public; Owner: api_user
--

SELECT pg_catalog.setval('public.crud_library_id_seq', 2, true);


--
-- Name: crud_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: api_user
--

SELECT pg_catalog.setval('public.crud_user_id_seq', 2, true);



--
-- Name: crud_library crud_library_pkey; Type: CONSTRAINT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.crud_library
    ADD CONSTRAINT crud_library_pkey PRIMARY KEY (id);


--
-- Name: crud_user crud_user_pkey; Type: CONSTRAINT; Schema: public; Owner: api_user
--

ALTER TABLE ONLY public.crud_user
    ADD CONSTRAINT crud_user_pkey PRIMARY KEY (id);



--
-- PostgreSQL database dump complete
--
