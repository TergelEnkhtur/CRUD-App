--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: crud_app_db_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO crud_app_db_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: crud_library; Type: TABLE; Schema: public; Owner: crud_app_db_user
--

CREATE TABLE public.crud_library (
    id integer NOT NULL,
    book_title character varying(50),
    author_name character varying(50),
    genre character varying(50),
    isbn character(17),
    books_available integer
);


ALTER TABLE public.crud_library OWNER TO crud_app_db_user;

--
-- Name: crud_library_id_seq; Type: SEQUENCE; Schema: public; Owner: crud_app_db_user
--

CREATE SEQUENCE public.crud_library_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crud_library_id_seq OWNER TO crud_app_db_user;

--
-- Name: crud_library_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: crud_app_db_user
--

ALTER SEQUENCE public.crud_library_id_seq OWNED BY public.crud_library.id;


--
-- Name: crud_rented_books; Type: TABLE; Schema: public; Owner: crud_app_db_user
--

CREATE TABLE public.crud_rented_books (
    id integer NOT NULL,
    book_title character varying(50),
    author_name character varying(50),
    genre character varying(50),
    isbn character(17)
);


ALTER TABLE public.crud_rented_books OWNER TO crud_app_db_user;

--
-- Name: crud_rented_books_id_seq; Type: SEQUENCE; Schema: public; Owner: crud_app_db_user
--

CREATE SEQUENCE public.crud_rented_books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crud_rented_books_id_seq OWNER TO crud_app_db_user;

--
-- Name: crud_rented_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: crud_app_db_user
--

ALTER SEQUENCE public.crud_rented_books_id_seq OWNED BY public.crud_rented_books.id;


--
-- Name: crud_reservations; Type: TABLE; Schema: public; Owner: crud_app_db_user
--

CREATE TABLE public.crud_reservations (
    id integer NOT NULL,
    book_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.crud_reservations OWNER TO crud_app_db_user;

--
-- Name: crud_reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: crud_app_db_user
--

CREATE SEQUENCE public.crud_reservations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crud_reservations_id_seq OWNER TO crud_app_db_user;

--
-- Name: crud_reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: crud_app_db_user
--

ALTER SEQUENCE public.crud_reservations_id_seq OWNED BY public.crud_reservations.id;


--
-- Name: crud_user; Type: TABLE; Schema: public; Owner: crud_app_db_user
--

CREATE TABLE public.crud_user (
    id integer NOT NULL,
    fullname character varying(50),
    username character varying(25) NOT NULL,
    password character varying(25) NOT NULL,
    repassword character varying(25) NOT NULL,
    userrole character varying(10) NOT NULL
);


ALTER TABLE public.crud_user OWNER TO crud_app_db_user;

--
-- Name: crud_user_id_seq; Type: SEQUENCE; Schema: public; Owner: crud_app_db_user
--

CREATE SEQUENCE public.crud_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crud_user_id_seq OWNER TO crud_app_db_user;

--
-- Name: crud_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: crud_app_db_user
--

ALTER SEQUENCE public.crud_user_id_seq OWNED BY public.crud_user.id;


--
-- Name: crud_library id; Type: DEFAULT; Schema: public; Owner: crud_app_db_user
--

ALTER TABLE ONLY public.crud_library ALTER COLUMN id SET DEFAULT nextval('public.crud_library_id_seq'::regclass);


--
-- Name: crud_rented_books id; Type: DEFAULT; Schema: public; Owner: crud_app_db_user
--

ALTER TABLE ONLY public.crud_rented_books ALTER COLUMN id SET DEFAULT nextval('public.crud_rented_books_id_seq'::regclass);


--
-- Name: crud_reservations id; Type: DEFAULT; Schema: public; Owner: crud_app_db_user
--

ALTER TABLE ONLY public.crud_reservations ALTER COLUMN id SET DEFAULT nextval('public.crud_reservations_id_seq'::regclass);


--
-- Name: crud_user id; Type: DEFAULT; Schema: public; Owner: crud_app_db_user
--

ALTER TABLE ONLY public.crud_user ALTER COLUMN id SET DEFAULT nextval('public.crud_user_id_seq'::regclass);


--
-- Data for Name: crud_library; Type: TABLE DATA; Schema: public; Owner: crud_app_db_user
--

COPY public.crud_library (id, book_title, author_name, genre, isbn, books_available) FROM stdin;
2	Grit: The Power of Passion and Perseverance	Angela Duckworth	Self-help book	978-1-501111-10-9	123
1	Harry Potter	J. K. Rowling	Adventure	978-3-16-148410-3	43
3	The Game of Thrones	J. R. R Tolkien	Fantasy Epic	978-0-553103-54-0	45
4	Diary Of A Wimpy Kid	Jeff Kinney	Fiction	978-1-419741-85-2	62
5	Hyperion	Dan Simmons	Science Fiction	978-0-399178-61-0	55
6	Leviathan Wakes	James S. A. Corey	Science Fiction	978-0-316129-08-4	59
\.


--
-- Data for Name: crud_rented_books; Type: TABLE DATA; Schema: public; Owner: crud_app_db_user
--

COPY public.crud_rented_books (id, book_title, author_name, genre, isbn) FROM stdin;
1	Harry Potter	J.K. Rowling	Adventure	978-1-501111-10-9
\.


--
-- Data for Name: crud_reservations; Type: TABLE DATA; Schema: public; Owner: crud_app_db_user
--

COPY public.crud_reservations (id, book_id, user_id) FROM stdin;
4	3	25
\.


--
-- Data for Name: crud_user; Type: TABLE DATA; Schema: public; Owner: crud_app_db_user
--

COPY public.crud_user (id, fullname, username, password, repassword, userrole) FROM stdin;
25	patron	patron	patron	patron	patron
26	librarian	librarian	librarian	librarian	librarian
\.


--
-- Name: crud_library_id_seq; Type: SEQUENCE SET; Schema: public; Owner: crud_app_db_user
--

SELECT pg_catalog.setval('public.crud_library_id_seq', 23, true);


--
-- Name: crud_rented_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: crud_app_db_user
--

SELECT pg_catalog.setval('public.crud_rented_books_id_seq', 1, true);


--
-- Name: crud_reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: crud_app_db_user
--

SELECT pg_catalog.setval('public.crud_reservations_id_seq', 4, true);


--
-- Name: crud_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: crud_app_db_user
--

SELECT pg_catalog.setval('public.crud_user_id_seq', 26, true);


--
-- Name: crud_library crud_library_pkey; Type: CONSTRAINT; Schema: public; Owner: crud_app_db_user
--

ALTER TABLE ONLY public.crud_library
    ADD CONSTRAINT crud_library_pkey PRIMARY KEY (id);


--
-- Name: crud_rented_books crud_rented_books_pkey; Type: CONSTRAINT; Schema: public; Owner: crud_app_db_user
--

ALTER TABLE ONLY public.crud_rented_books
    ADD CONSTRAINT crud_rented_books_pkey PRIMARY KEY (id);


--
-- Name: crud_reservations crud_reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: crud_app_db_user
--

ALTER TABLE ONLY public.crud_reservations
    ADD CONSTRAINT crud_reservations_pkey PRIMARY KEY (id);


--
-- Name: crud_user crud_user_pkey; Type: CONSTRAINT; Schema: public; Owner: crud_app_db_user
--

ALTER TABLE ONLY public.crud_user
    ADD CONSTRAINT crud_user_pkey PRIMARY KEY (id);


--
-- Name: crud_reservations fk_library; Type: FK CONSTRAINT; Schema: public; Owner: crud_app_db_user
--

ALTER TABLE ONLY public.crud_reservations
    ADD CONSTRAINT fk_library FOREIGN KEY (book_id) REFERENCES public.crud_library(id) ON DELETE CASCADE;


--
-- Name: crud_reservations fk_user; Type: FK CONSTRAINT; Schema: public; Owner: crud_app_db_user
--

ALTER TABLE ONLY public.crud_reservations
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.crud_user(id) ON DELETE CASCADE;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO crud_app_db_user;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO crud_app_db_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO crud_app_db_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO crud_app_db_user;


--
-- PostgreSQL database dump complete
--

