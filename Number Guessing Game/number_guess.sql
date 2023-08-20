--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: records; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.records (
    record_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.records OWNER TO freecodecamp;

--
-- Name: records_record_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.records_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_record_id_seq OWNER TO freecodecamp;

--
-- Name: records_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.records_record_id_seq OWNED BY public.records.record_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: records record_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.records ALTER COLUMN record_id SET DEFAULT nextval('public.records_record_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.records VALUES (1, 1, 2);
INSERT INTO public.records VALUES (2, 1, 1);
INSERT INTO public.records VALUES (3, 1, 9);
INSERT INTO public.records VALUES (4, 2, 493);
INSERT INTO public.records VALUES (5, 2, 154);
INSERT INTO public.records VALUES (6, 3, 570);
INSERT INTO public.records VALUES (7, 3, 745);
INSERT INTO public.records VALUES (8, 2, 702);
INSERT INTO public.records VALUES (9, 2, 218);
INSERT INTO public.records VALUES (10, 2, 795);
INSERT INTO public.records VALUES (11, 4, 92);
INSERT INTO public.records VALUES (12, 4, 87);
INSERT INTO public.records VALUES (13, 5, 601);
INSERT INTO public.records VALUES (14, 5, 123);
INSERT INTO public.records VALUES (15, 4, 294);
INSERT INTO public.records VALUES (16, 4, 981);
INSERT INTO public.records VALUES (17, 4, 267);
INSERT INTO public.records VALUES (18, 6, 261);
INSERT INTO public.records VALUES (19, 6, 628);
INSERT INTO public.records VALUES (20, 7, 119);
INSERT INTO public.records VALUES (21, 7, 920);
INSERT INTO public.records VALUES (22, 6, 448);
INSERT INTO public.records VALUES (23, 6, 663);
INSERT INTO public.records VALUES (24, 6, 327);
INSERT INTO public.records VALUES (25, 8, 544);
INSERT INTO public.records VALUES (26, 8, 135);
INSERT INTO public.records VALUES (27, 9, 263);
INSERT INTO public.records VALUES (28, 9, 281);
INSERT INTO public.records VALUES (29, 8, 439);
INSERT INTO public.records VALUES (30, 8, 448);
INSERT INTO public.records VALUES (31, 8, 601);
INSERT INTO public.records VALUES (32, 10, 58);
INSERT INTO public.records VALUES (33, 10, 883);
INSERT INTO public.records VALUES (34, 11, 385);
INSERT INTO public.records VALUES (35, 11, 5);
INSERT INTO public.records VALUES (36, 10, 751);
INSERT INTO public.records VALUES (37, 10, 928);
INSERT INTO public.records VALUES (38, 10, 664);
INSERT INTO public.records VALUES (39, 12, 936);
INSERT INTO public.records VALUES (40, 12, 242);
INSERT INTO public.records VALUES (41, 13, 866);
INSERT INTO public.records VALUES (42, 13, 682);
INSERT INTO public.records VALUES (43, 12, 240);
INSERT INTO public.records VALUES (44, 12, 119);
INSERT INTO public.records VALUES (45, 12, 275);
INSERT INTO public.records VALUES (46, 14, 510);
INSERT INTO public.records VALUES (47, 14, 618);
INSERT INTO public.records VALUES (48, 15, 396);
INSERT INTO public.records VALUES (49, 15, 921);
INSERT INTO public.records VALUES (50, 14, 664);
INSERT INTO public.records VALUES (51, 14, 406);
INSERT INTO public.records VALUES (52, 14, 887);
INSERT INTO public.records VALUES (53, 1, 9);
INSERT INTO public.records VALUES (54, 16, 532);
INSERT INTO public.records VALUES (55, 16, 331);
INSERT INTO public.records VALUES (56, 17, 945);
INSERT INTO public.records VALUES (57, 17, 111);
INSERT INTO public.records VALUES (58, 16, 971);
INSERT INTO public.records VALUES (59, 16, 178);
INSERT INTO public.records VALUES (60, 16, 170);
INSERT INTO public.records VALUES (61, 18, 193);
INSERT INTO public.records VALUES (62, 18, 764);
INSERT INTO public.records VALUES (63, 19, 489);
INSERT INTO public.records VALUES (64, 19, 242);
INSERT INTO public.records VALUES (65, 18, 808);
INSERT INTO public.records VALUES (66, 18, 755);
INSERT INTO public.records VALUES (67, 18, 954);
INSERT INTO public.records VALUES (68, 20, 502);
INSERT INTO public.records VALUES (69, 20, 465);
INSERT INTO public.records VALUES (70, 21, 696);
INSERT INTO public.records VALUES (71, 21, 542);
INSERT INTO public.records VALUES (72, 20, 489);
INSERT INTO public.records VALUES (73, 20, 830);
INSERT INTO public.records VALUES (74, 20, 145);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'José');
INSERT INTO public.users VALUES (2, 'user_1664289771675');
INSERT INTO public.users VALUES (3, 'user_1664289771674');
INSERT INTO public.users VALUES (4, 'user_1664289812919');
INSERT INTO public.users VALUES (5, 'user_1664289812918');
INSERT INTO public.users VALUES (6, 'user_1664289881383');
INSERT INTO public.users VALUES (7, 'user_1664289881382');
INSERT INTO public.users VALUES (8, 'user_1664289897079');
INSERT INTO public.users VALUES (9, 'user_1664289897078');
INSERT INTO public.users VALUES (10, 'user_1664289962943');
INSERT INTO public.users VALUES (11, 'user_1664289962942');
INSERT INTO public.users VALUES (12, 'user_1664290002336');
INSERT INTO public.users VALUES (13, 'user_1664290002335');
INSERT INTO public.users VALUES (14, 'user_1664290006385');
INSERT INTO public.users VALUES (15, 'user_1664290006384');
INSERT INTO public.users VALUES (16, 'user_1664290099765');
INSERT INTO public.users VALUES (17, 'user_1664290099764');
INSERT INTO public.users VALUES (18, 'user_1664290139022');
INSERT INTO public.users VALUES (19, 'user_1664290139021');
INSERT INTO public.users VALUES (20, 'user_1664290226473');
INSERT INTO public.users VALUES (21, 'user_1664290226471');


--
-- Name: records_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.records_record_id_seq', 74, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: records records_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

