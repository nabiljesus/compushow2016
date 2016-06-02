--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO compushowmaster;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO compushowmaster;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO compushowmaster;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO compushowmaster;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO compushowmaster;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO compushowmaster;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO compushowmaster;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO compushowmaster;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO compushowmaster;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO compushowmaster;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO compushowmaster;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO compushowmaster;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO compushowmaster;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO compushowmaster;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO compushowmaster;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO compushowmaster;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO compushowmaster;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO compushowmaster;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO compushowmaster;

--
-- Name: sistemaCS_categoria; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_categoria" (
    id integer NOT NULL,
    nombre character varying(200) NOT NULL
);


ALTER TABLE "sistemaCS_categoria" OWNER TO compushowmaster;

--
-- Name: sistemaCS_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE "sistemaCS_categoria_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sistemaCS_categoria_id_seq" OWNER TO compushowmaster;

--
-- Name: sistemaCS_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE "sistemaCS_categoria_id_seq" OWNED BY "sistemaCS_categoria".id;


--
-- Name: sistemaCS_choice; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_choice" (
    id integer NOT NULL,
    choice_text character varying(200) NOT NULL,
    votes integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE "sistemaCS_choice" OWNER TO compushowmaster;

--
-- Name: sistemaCS_choice_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE "sistemaCS_choice_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sistemaCS_choice_id_seq" OWNER TO compushowmaster;

--
-- Name: sistemaCS_choice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE "sistemaCS_choice_id_seq" OWNED BY "sistemaCS_choice".id;


--
-- Name: sistemaCS_imgnominacion; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_imgnominacion" (
    id integer NOT NULL,
    img character varying(200) NOT NULL,
    idcat_id integer NOT NULL,
    idnom_id integer NOT NULL
);


ALTER TABLE "sistemaCS_imgnominacion" OWNER TO compushowmaster;

--
-- Name: sistemaCS_imgnominacion_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE "sistemaCS_imgnominacion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sistemaCS_imgnominacion_id_seq" OWNER TO compushowmaster;

--
-- Name: sistemaCS_imgnominacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE "sistemaCS_imgnominacion_id_seq" OWNED BY "sistemaCS_imgnominacion".id;


--
-- Name: sistemaCS_nominacion; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_nominacion" (
    id integer NOT NULL,
    idcat_id integer NOT NULL,
    uid_id character varying(200) NOT NULL,
    unom_id character varying(200) NOT NULL
);


ALTER TABLE "sistemaCS_nominacion" OWNER TO compushowmaster;

--
-- Name: sistemaCS_nominacion_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE "sistemaCS_nominacion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sistemaCS_nominacion_id_seq" OWNER TO compushowmaster;

--
-- Name: sistemaCS_nominacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE "sistemaCS_nominacion_id_seq" OWNED BY "sistemaCS_nominacion".id;


--
-- Name: sistemaCS_question; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_question" (
    id integer NOT NULL,
    question_text character varying(200) NOT NULL,
    pub_date timestamp with time zone NOT NULL
);


ALTER TABLE "sistemaCS_question" OWNER TO compushowmaster;

--
-- Name: sistemaCS_question_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE "sistemaCS_question_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sistemaCS_question_id_seq" OWNER TO compushowmaster;

--
-- Name: sistemaCS_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE "sistemaCS_question_id_seq" OWNED BY "sistemaCS_question".id;


--
-- Name: sistemaCS_usuario; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_usuario" (
    uid character varying(200) NOT NULL,
    password character varying(200) NOT NULL,
    carnet character varying(200) NOT NULL
);


ALTER TABLE "sistemaCS_usuario" OWNER TO compushowmaster;

--
-- Name: sistemaCS_voto; Type: TABLE; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE TABLE "sistemaCS_voto" (
    id integer NOT NULL,
    idcat_id integer NOT NULL,
    idnom_id integer NOT NULL,
    uid_id character varying(200) NOT NULL
);


ALTER TABLE "sistemaCS_voto" OWNER TO compushowmaster;

--
-- Name: sistemaCS_voto_id_seq; Type: SEQUENCE; Schema: public; Owner: compushowmaster
--

CREATE SEQUENCE "sistemaCS_voto_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sistemaCS_voto_id_seq" OWNER TO compushowmaster;

--
-- Name: sistemaCS_voto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: compushowmaster
--

ALTER SEQUENCE "sistemaCS_voto_id_seq" OWNED BY "sistemaCS_voto".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_categoria" ALTER COLUMN id SET DEFAULT nextval('"sistemaCS_categoria_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_choice" ALTER COLUMN id SET DEFAULT nextval('"sistemaCS_choice_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_imgnominacion" ALTER COLUMN id SET DEFAULT nextval('"sistemaCS_imgnominacion_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_nominacion" ALTER COLUMN id SET DEFAULT nextval('"sistemaCS_nominacion_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_question" ALTER COLUMN id SET DEFAULT nextval('"sistemaCS_question_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_voto" ALTER COLUMN id SET DEFAULT nextval('"sistemaCS_voto_id_seq"'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add question	7	add_question
20	Can change question	7	change_question
21	Can delete question	7	delete_question
22	Can add choice	8	add_choice
23	Can change choice	8	change_choice
24	Can delete choice	8	delete_choice
25	Can add categoria	9	add_categoria
26	Can change categoria	9	change_categoria
27	Can delete categoria	9	delete_categoria
28	Can add usuario	10	add_usuario
29	Can change usuario	10	change_usuario
30	Can delete usuario	10	delete_usuario
31	Can add nominacion	11	add_nominacion
32	Can change nominacion	11	change_nominacion
33	Can delete nominacion	11	delete_nominacion
34	Can add img nominacion	12	add_imgnominacion
35	Can change img nominacion	12	change_imgnominacion
36	Can delete img nominacion	12	delete_imgnominacion
37	Can add voto	13	add_voto
38	Can change voto	13	change_voto
39	Can delete voto	13	delete_voto
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('auth_permission_id_seq', 39, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$20000$wMcEezYyMhQK$2aqH7euPJbJyHivs8OuQzAqOlO1Oux9Watu8luQ5mKA=	2016-06-01 01:47:52.86943-04:30	t	admin				t	t	2016-06-01 01:47:37.607389-04:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-06-01 01:48:39.646498-04:30	1	adoptado	1		9	1
2	2016-06-01 01:49:46.160612-04:30	2	butt	1		9	1
3	2016-06-01 01:49:51.761119-04:30	3	cartoon	1		9	1
4	2016-06-01 01:49:57.270179-04:30	4	chancero	1		9	1
5	2016-06-01 01:50:02.15989-04:30	5	comadre	1		9	1
6	2016-06-01 01:50:07.446107-04:30	6	compadre	1		9	1
7	2016-06-01 01:50:10.084135-04:30	7	cono	1		9	1
8	2016-06-01 01:50:13.942259-04:30	8	cuaima	1		9	1
9	2016-06-01 01:50:17.293025-04:30	9	cuchio	1		9	1
10	2016-06-01 01:50:25.00219-04:30	9	cuchio	3		9	1
11	2016-06-01 01:50:31.174892-04:30	10	cuchi	1		9	1
12	2016-06-01 01:50:35.148982-04:30	11	falso	1		9	1
13	2016-06-01 01:50:38.860843-04:30	12	fitness	1		9	1
14	2016-06-01 01:50:42.044782-04:30	13	gordito	1		9	1
15	2016-06-01 01:50:45.957253-04:30	14	lolas	1		9	1
16	2016-06-01 01:50:48.597738-04:30	15	love	1		9	1
17	2016-06-01 01:50:51.268951-04:30	16	mami	1		9	1
18	2016-06-01 01:50:54.076798-04:30	17	master	1		9	1
19	2016-06-01 01:50:56.588722-04:30	18	papi	1		9	1
20	2016-06-01 01:50:59.244717-04:30	19	pro	1		9	1
21	2016-06-01 01:51:02.612414-04:30	20	productista	1		9	1
22	2016-06-01 01:51:04.909128-04:30	21	team	1		9	1
23	2016-06-01 02:21:07.015648-04:30	11-10683	11-10683	1		10	1
24	2016-06-01 02:22:26.268392-04:30	3	3	1		11	1
25	2016-06-01 02:22:44.0878-04:30	3	3	3		11	1
26	2016-06-01 02:24:31.466764-04:30	4	<Usuario: 11-10683>-><Usuario: 11-10683>( <Categoria: adoptado> )	1		11	1
27	2016-06-01 02:25:00.576858-04:30	4	<Usuario: 11-10683>=><Usuario: 11-10683>( <Categoria: adoptado> )	3		11	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 27, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sistemaCS	question
8	sistemaCS	choice
9	sistemaCS	categoria
10	sistemaCS	usuario
11	sistemaCS	nominacion
12	sistemaCS	imgnominacion
13	sistemaCS	voto
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('django_content_type_id_seq', 13, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-06-01 00:09:36.713747-04:30
2	auth	0001_initial	2016-06-01 00:09:37.555819-04:30
3	admin	0001_initial	2016-06-01 00:09:37.780993-04:30
4	contenttypes	0002_remove_content_type_name	2016-06-01 00:09:37.882479-04:30
5	auth	0002_alter_permission_name_max_length	2016-06-01 00:09:37.976068-04:30
6	auth	0003_alter_user_email_max_length	2016-06-01 00:09:38.06931-04:30
7	auth	0004_alter_user_username_opts	2016-06-01 00:09:38.099196-04:30
8	auth	0005_alter_user_last_login_null	2016-06-01 00:09:38.152557-04:30
9	auth	0006_require_contenttypes_0002	2016-06-01 00:09:38.173397-04:30
10	sessions	0001_initial	2016-06-01 00:09:38.354012-04:30
11	sistemaCS	0001_initial	2016-06-01 00:09:38.50324-04:30
12	sistemaCS	0002_categoria	2016-06-01 01:46:00.256258-04:30
13	sistemaCS	0003_auto_20160601_0649	2016-06-01 02:19:52.462307-04:30
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('django_migrations_id_seq', 13, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
235ysw21z6x4t84ka010jk2wgrs8zr2e	Njc0MTFiZThhZjE5MDYwY2UwZjU2OTIyYjM3MmM5NDk4OTZlZTA4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlMDgyNWMxZmM1MWE5OTA5OTJlNzM1NjVhNjNmM2NjMGIzM2I3NzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-06-15 01:47:52.89139-04:30
\.


--
-- Data for Name: sistemaCS_categoria; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_categoria" (id, nombre) FROM stdin;
1	adoptado
2	butt
3	cartoon
4	chancero
5	comadre
6	compadre
7	cono
8	cuaima
10	cuchi
11	falso
12	fitness
13	gordito
14	lolas
15	love
16	mami
17	master
18	papi
19	pro
20	productista
21	team
\.


--
-- Name: sistemaCS_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('"sistemaCS_categoria_id_seq"', 21, true);


--
-- Data for Name: sistemaCS_choice; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_choice" (id, choice_text, votes, question_id) FROM stdin;
\.


--
-- Name: sistemaCS_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('"sistemaCS_choice_id_seq"', 1, false);


--
-- Data for Name: sistemaCS_imgnominacion; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_imgnominacion" (id, img, idcat_id, idnom_id) FROM stdin;
\.


--
-- Name: sistemaCS_imgnominacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('"sistemaCS_imgnominacion_id_seq"', 1, false);


--
-- Data for Name: sistemaCS_nominacion; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_nominacion" (id, idcat_id, uid_id, unom_id) FROM stdin;
\.


--
-- Name: sistemaCS_nominacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('"sistemaCS_nominacion_id_seq"', 4, true);


--
-- Data for Name: sistemaCS_question; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_question" (id, question_text, pub_date) FROM stdin;
\.


--
-- Name: sistemaCS_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('"sistemaCS_question_id_seq"', 1, false);


--
-- Data for Name: sistemaCS_usuario; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_usuario" (uid, password, carnet) FROM stdin;
11-10683	123	11-10683
\.


--
-- Data for Name: sistemaCS_voto; Type: TABLE DATA; Schema: public; Owner: compushowmaster
--

COPY "sistemaCS_voto" (id, idcat_id, idnom_id, uid_id) FROM stdin;
\.


--
-- Name: sistemaCS_voto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: compushowmaster
--

SELECT pg_catalog.setval('"sistemaCS_voto_id_seq"', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: sistemaCS_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_categoria"
    ADD CONSTRAINT "sistemaCS_categoria_pkey" PRIMARY KEY (id);


--
-- Name: sistemaCS_choice_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_choice"
    ADD CONSTRAINT "sistemaCS_choice_pkey" PRIMARY KEY (id);


--
-- Name: sistemaCS_imgnominacion_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_imgnominacion"
    ADD CONSTRAINT "sistemaCS_imgnominacion_pkey" PRIMARY KEY (id);


--
-- Name: sistemaCS_nominacion_idcat_id_18520b2f8ff5d03e_uniq; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_nominacion"
    ADD CONSTRAINT "sistemaCS_nominacion_idcat_id_18520b2f8ff5d03e_uniq" UNIQUE (idcat_id, unom_id, uid_id);


--
-- Name: sistemaCS_nominacion_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_nominacion"
    ADD CONSTRAINT "sistemaCS_nominacion_pkey" PRIMARY KEY (id);


--
-- Name: sistemaCS_question_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_question"
    ADD CONSTRAINT "sistemaCS_question_pkey" PRIMARY KEY (id);


--
-- Name: sistemaCS_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_usuario"
    ADD CONSTRAINT "sistemaCS_usuario_pkey" PRIMARY KEY (uid);


--
-- Name: sistemaCS_voto_idcat_id_6dbd2338324ba85e_uniq; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_voto"
    ADD CONSTRAINT "sistemaCS_voto_idcat_id_6dbd2338324ba85e_uniq" UNIQUE (idcat_id, uid_id);


--
-- Name: sistemaCS_voto_pkey; Type: CONSTRAINT; Schema: public; Owner: compushowmaster; Tablespace: 
--

ALTER TABLE ONLY "sistemaCS_voto"
    ADD CONSTRAINT "sistemaCS_voto_pkey" PRIMARY KEY (id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: sistemaCS_choice_7aa0f6ee; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_choice_7aa0f6ee" ON "sistemaCS_choice" USING btree (question_id);


--
-- Name: sistemaCS_imgnominacion_9bbe0886; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_imgnominacion_9bbe0886" ON "sistemaCS_imgnominacion" USING btree (idnom_id);


--
-- Name: sistemaCS_imgnominacion_df5b9745; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_imgnominacion_df5b9745" ON "sistemaCS_imgnominacion" USING btree (idcat_id);


--
-- Name: sistemaCS_nominacion_71422c2d; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_nominacion_71422c2d" ON "sistemaCS_nominacion" USING btree (uid_id);


--
-- Name: sistemaCS_nominacion_a61012f2; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_nominacion_a61012f2" ON "sistemaCS_nominacion" USING btree (unom_id);


--
-- Name: sistemaCS_nominacion_df5b9745; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_nominacion_df5b9745" ON "sistemaCS_nominacion" USING btree (idcat_id);


--
-- Name: sistemaCS_usuario_uid_9ab466579ba6562_like; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_usuario_uid_9ab466579ba6562_like" ON "sistemaCS_usuario" USING btree (uid varchar_pattern_ops);


--
-- Name: sistemaCS_voto_71422c2d; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_voto_71422c2d" ON "sistemaCS_voto" USING btree (uid_id);


--
-- Name: sistemaCS_voto_9bbe0886; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_voto_9bbe0886" ON "sistemaCS_voto" USING btree (idnom_id);


--
-- Name: sistemaCS_voto_df5b9745; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_voto_df5b9745" ON "sistemaCS_voto" USING btree (idcat_id);


--
-- Name: sistemaCS_voto_uid_id_5352d68629f21396_like; Type: INDEX; Schema: public; Owner: compushowmaster; Tablespace: 
--

CREATE INDEX "sistemaCS_voto_uid_id_5352d68629f21396_like" ON "sistemaCS_voto" USING btree (uid_id varchar_pattern_ops);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS__idnom_id_2f8015efdbde110e_fk_sistemaCS_nominacion_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_imgnominacion"
    ADD CONSTRAINT "sistemaCS__idnom_id_2f8015efdbde110e_fk_sistemaCS_nominacion_id" FOREIGN KEY (idnom_id) REFERENCES "sistemaCS_nominacion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_i_idcat_id_6d1f8868e425dc84_fk_sistemaCS_categoria_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_imgnominacion"
    ADD CONSTRAINT "sistemaCS_i_idcat_id_6d1f8868e425dc84_fk_sistemaCS_categoria_id" FOREIGN KEY (idcat_id) REFERENCES "sistemaCS_categoria"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_n_idcat_id_3e4ea2f3e61af080_fk_sistemaCS_categoria_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_nominacion"
    ADD CONSTRAINT "sistemaCS_n_idcat_id_3e4ea2f3e61af080_fk_sistemaCS_categoria_id" FOREIGN KEY (idcat_id) REFERENCES "sistemaCS_categoria"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_nom_unom_id_645cefd61f6cc73b_fk_sistemaCS_usuario_uid; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_nominacion"
    ADD CONSTRAINT "sistemaCS_nom_unom_id_645cefd61f6cc73b_fk_sistemaCS_usuario_uid" FOREIGN KEY (unom_id) REFERENCES "sistemaCS_usuario"(uid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_nomi_uid_id_60047dac2663a317_fk_sistemaCS_usuario_uid; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_nominacion"
    ADD CONSTRAINT "sistemaCS_nomi_uid_id_60047dac2663a317_fk_sistemaCS_usuario_uid" FOREIGN KEY (uid_id) REFERENCES "sistemaCS_usuario"(uid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_question_id_19f0a12a12f2a04a_fk_sistemaCS_question_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_choice"
    ADD CONSTRAINT "sistemaCS_question_id_19f0a12a12f2a04a_fk_sistemaCS_question_id" FOREIGN KEY (question_id) REFERENCES "sistemaCS_question"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_v_idcat_id_53df938c2083bc8d_fk_sistemaCS_categoria_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_voto"
    ADD CONSTRAINT "sistemaCS_v_idcat_id_53df938c2083bc8d_fk_sistemaCS_categoria_id" FOREIGN KEY (idcat_id) REFERENCES "sistemaCS_categoria"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_v_idnom_id_e1e95537a5d36d1_fk_sistemaCS_nominacion_id; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_voto"
    ADD CONSTRAINT "sistemaCS_v_idnom_id_e1e95537a5d36d1_fk_sistemaCS_nominacion_id" FOREIGN KEY (idnom_id) REFERENCES "sistemaCS_nominacion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sistemaCS_voto_uid_id_5352d68629f21396_fk_sistemaCS_usuario_uid; Type: FK CONSTRAINT; Schema: public; Owner: compushowmaster
--

ALTER TABLE ONLY "sistemaCS_voto"
    ADD CONSTRAINT "sistemaCS_voto_uid_id_5352d68629f21396_fk_sistemaCS_usuario_uid" FOREIGN KEY (uid_id) REFERENCES "sistemaCS_usuario"(uid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

