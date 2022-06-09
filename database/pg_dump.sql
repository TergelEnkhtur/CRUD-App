--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Ubuntu 14.2-1.pgdg20.04+1+b1)
-- Dumped by pg_dump version 14.2

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
-- Name: crud_library; Type: TABLE; Schema: public; Owner: vsfyqnuvlawoyi
--

CREATE TABLE public.crud_library (
    id integer NOT NULL,
    book_title character varying(50),
    author_name character varying(50),
    genre character varying(50),
    isbn character(17),
    books_available integer
);


ALTER TABLE public.crud_library OWNER TO vsfyqnuvlawoyi;

--
-- Name: crud_library_id_seq; Type: SEQUENCE; Schema: public; Owner: vsfyqnuvlawoyi
--

CREATE SEQUENCE public.crud_library_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crud_library_id_seq OWNER TO vsfyqnuvlawoyi;

--
-- Name: crud_library_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER SEQUENCE public.crud_library_id_seq OWNED BY public.crud_library.id;


--
-- Name: crud_rented_books; Type: TABLE; Schema: public; Owner: vsfyqnuvlawoyi
--

CREATE TABLE public.crud_rented_books (
    id integer NOT NULL,
    book_title character varying(50),
    author_name character varying(50),
    genre character varying(50),
    isbn character(17)
);


ALTER TABLE public.crud_rented_books OWNER TO vsfyqnuvlawoyi;

--
-- Name: crud_rented_books_id_seq; Type: SEQUENCE; Schema: public; Owner: vsfyqnuvlawoyi
--

CREATE SEQUENCE public.crud_rented_books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crud_rented_books_id_seq OWNER TO vsfyqnuvlawoyi;

--
-- Name: crud_rented_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER SEQUENCE public.crud_rented_books_id_seq OWNED BY public.crud_rented_books.id;


--
-- Name: crud_reservations; Type: TABLE; Schema: public; Owner: vsfyqnuvlawoyi
--

CREATE TABLE public.crud_reservations (
    id integer NOT NULL,
    book_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.crud_reservations OWNER TO vsfyqnuvlawoyi;

--
-- Name: crud_reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: vsfyqnuvlawoyi
--

CREATE SEQUENCE public.crud_reservations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crud_reservations_id_seq OWNER TO vsfyqnuvlawoyi;

--
-- Name: crud_reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER SEQUENCE public.crud_reservations_id_seq OWNED BY public.crud_reservations.id;


--
-- Name: crud_user; Type: TABLE; Schema: public; Owner: vsfyqnuvlawoyi
--

CREATE TABLE public.crud_user (
    id integer NOT NULL,
    fullname character varying(50),
    username character varying(25) NOT NULL,
    password character varying(25) NOT NULL,
    repassword character varying(25) NOT NULL,
    userrole character varying(10) NOT NULL
);


ALTER TABLE public.crud_user OWNER TO vsfyqnuvlawoyi;

--
-- Name: crud_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vsfyqnuvlawoyi
--

CREATE SEQUENCE public.crud_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crud_user_id_seq OWNER TO vsfyqnuvlawoyi;

--
-- Name: crud_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER SEQUENCE public.crud_user_id_seq OWNED BY public.crud_user.id;


--
-- Name: crud_library id; Type: DEFAULT; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER TABLE ONLY public.crud_library ALTER COLUMN id SET DEFAULT nextval('public.crud_library_id_seq'::regclass);


--
-- Name: crud_rented_books id; Type: DEFAULT; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER TABLE ONLY public.crud_rented_books ALTER COLUMN id SET DEFAULT nextval('public.crud_rented_books_id_seq'::regclass);


--
-- Name: crud_reservations id; Type: DEFAULT; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER TABLE ONLY public.crud_reservations ALTER COLUMN id SET DEFAULT nextval('public.crud_reservations_id_seq'::regclass);


--
-- Name: crud_user id; Type: DEFAULT; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER TABLE ONLY public.crud_user ALTER COLUMN id SET DEFAULT nextval('public.crud_user_id_seq'::regclass);


--
-- Data for Name: crud_library; Type: TABLE DATA; Schema: public; Owner: vsfyqnuvlawoyi
--

COPY public.crud_library (id, book_title, author_name, genre, isbn, books_available) FROM stdin;
26	The Silmarillion	J. R. R Tolkien	Fantasy Epic	978-0-618135-04-2	5
27	Diary Of A Wimpy Kid	Jeff Kinney	Fiction	978-1-419741-85-2	6
28	Hyperion	Dan Simmons	Science Fiction	978-0-399178-61-0	5
29	Leviathan Wakes	James S. A. Corey	Science Fiction	978-0-316129-08-4	6
24	Grit: The Power of Passion and Perseverance	Angela Duckworth	Self-help book	978-3-16-148410-3	123
30	e	e	e	978-1-501111-10-5	2
\.


--
-- Data for Name: crud_rented_books; Type: TABLE DATA; Schema: public; Owner: vsfyqnuvlawoyi
--

COPY public.crud_rented_books (id, book_title, author_name, genre, isbn) FROM stdin;
1	Harry Potter	J.K. Rowling	Adventure	978-1-501111-10-9
\.


--
-- Data for Name: crud_reservations; Type: TABLE DATA; Schema: public; Owner: vsfyqnuvlawoyi
--

COPY public.crud_reservations (id, book_id, user_id) FROM stdin;
1	20	8
2	20	8
3	10	8
4	10	8
6	25	8
8	27	29
9	29	30
\.


--
-- Data for Name: crud_user; Type: TABLE DATA; Schema: public; Owner: vsfyqnuvlawoyi
--

COPY public.crud_user (id, fullname, username, password, repassword, userrole) FROM stdin;
8	Severus	Joker	Lily	Lily	patron
26	Clark Kent	Superman	Lois	Lois	librarian
29	Rohan Panchal	user	1234	1234	patron
30	Tergel	Tergel	123	Pok	patron
\.


--
-- Name: crud_library_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vsfyqnuvlawoyi
--

SELECT pg_catalog.setval('public.crud_library_id_seq', 29, true);


--
-- Name: crud_rented_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vsfyqnuvlawoyi
--

SELECT pg_catalog.setval('public.crud_rented_books_id_seq', 1, true);


--
-- Name: crud_reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vsfyqnuvlawoyi
--

SELECT pg_catalog.setval('public.crud_reservations_id_seq', 9, true);


--
-- Name: crud_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vsfyqnuvlawoyi
--

SELECT pg_catalog.setval('public.crud_user_id_seq', 30, true);


--
-- Name: crud_library crud_library_pkey; Type: CONSTRAINT; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER TABLE ONLY public.crud_library
    ADD CONSTRAINT crud_library_pkey PRIMARY KEY (id);


--
-- Name: crud_rented_books crud_rented_books_pkey; Type: CONSTRAINT; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER TABLE ONLY public.crud_rented_books
    ADD CONSTRAINT crud_rented_books_pkey PRIMARY KEY (id);


--
-- Name: crud_reservations crud_reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER TABLE ONLY public.crud_reservations
    ADD CONSTRAINT crud_reservations_pkey PRIMARY KEY (id);


--
-- Name: crud_user crud_user_pkey; Type: CONSTRAINT; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER TABLE ONLY public.crud_user
    ADD CONSTRAINT crud_user_pkey PRIMARY KEY (id);


--
-- Name: crud_reservations fk_user; Type: FK CONSTRAINT; Schema: public; Owner: vsfyqnuvlawoyi
--

ALTER TABLE ONLY public.crud_reservations
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.crud_user(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: vsfyqnuvlawoyi
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO vsfyqnuvlawoyi;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO vsfyqnuvlawoyi;


--
-- PostgreSQL database dump complete
--

