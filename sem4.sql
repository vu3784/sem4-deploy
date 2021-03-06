PGDMP                         x            sem4    12.3    12.3 `    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17044    sem4    DATABASE     �   CREATE DATABASE sem4 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.936' LC_CTYPE = 'English_United States.936';
    DROP DATABASE sem4;
                postgres    false            �            1259    17045    bookings    TABLE     5  CREATE TABLE public.bookings (
    id bigint NOT NULL,
    tour_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    price numeric NOT NULL,
    paid boolean DEFAULT true,
    quantity bigint NOT NULL,
    is_cancelled boolean
);
    DROP TABLE public.bookings;
       public         heap    postgres    false            �            1259    17053    Bookings_id_seq    SEQUENCE     z   CREATE SEQUENCE public."Bookings_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Bookings_id_seq";
       public          postgres    false    202            �           0    0    Bookings_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Bookings_id_seq" OWNED BY public.bookings.id;
          public          postgres    false    203            �            1259    17055    guides    TABLE     �   CREATE TABLE public.guides (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    description text NOT NULL,
    number_of_ratings integer DEFAULT 0 NOT NULL,
    rating_average numeric NOT NULL
);
    DROP TABLE public.guides;
       public         heap    postgres    false            �            1259    17062    Guides_id_seq    SEQUENCE     x   CREATE SEQUENCE public."Guides_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Guides_id_seq";
       public          postgres    false    204            �           0    0    Guides_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Guides_id_seq" OWNED BY public.guides.id;
          public          postgres    false    205            �            1259    17064 	   locations    TABLE     �   CREATE TABLE public.locations (
    id bigint NOT NULL,
    name character varying NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL,
    address character varying NOT NULL,
    is_active boolean
);
    DROP TABLE public.locations;
       public         heap    postgres    false            �            1259    17070    Locations_id_seq    SEQUENCE     {   CREATE SEQUENCE public."Locations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Locations_id_seq";
       public          postgres    false    206            �           0    0    Locations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Locations_id_seq" OWNED BY public.locations.id;
          public          postgres    false    207            �            1259    17072    review_guides    TABLE       CREATE TABLE public.review_guides (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    guide_id bigint NOT NULL,
    review text NOT NULL,
    rating integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    active boolean
);
 !   DROP TABLE public.review_guides;
       public         heap    postgres    false            �            1259    17079    ReviewGuides_id_seq    SEQUENCE     ~   CREATE SEQUENCE public."ReviewGuides_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."ReviewGuides_id_seq";
       public          postgres    false    208            �           0    0    ReviewGuides_id_seq    SEQUENCE OWNED BY     N   ALTER SEQUENCE public."ReviewGuides_id_seq" OWNED BY public.review_guides.id;
          public          postgres    false    209            �            1259    17081    review_tours    TABLE       CREATE TABLE public.review_tours (
    id bigint NOT NULL,
    review text NOT NULL,
    rating integer NOT NULL,
    user_id bigint NOT NULL,
    tour_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    active boolean
);
     DROP TABLE public.review_tours;
       public         heap    postgres    false            �            1259    17088    Reviews_id_seq    SEQUENCE     y   CREATE SEQUENCE public."Reviews_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Reviews_id_seq";
       public          postgres    false    210            �           0    0    Reviews_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public."Reviews_id_seq" OWNED BY public.review_tours.id;
          public          postgres    false    211            �            1259    17090    roles    TABLE     [   CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    17096    Roles_id_seq    SEQUENCE     w   CREATE SEQUENCE public."Roles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Roles_id_seq";
       public          postgres    false    212            �           0    0    Roles_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Roles_id_seq" OWNED BY public.roles.id;
          public          postgres    false    213            �            1259    17098    tour_images    TABLE     z   CREATE TABLE public.tour_images (
    id bigint NOT NULL,
    tour_id bigint,
    image_url character varying NOT NULL
);
    DROP TABLE public.tour_images;
       public         heap    postgres    false            �            1259    17104    TourImages_id_seq    SEQUENCE     |   CREATE SEQUENCE public."TourImages_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."TourImages_id_seq";
       public          postgres    false    214            �           0    0    TourImages_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public."TourImages_id_seq" OWNED BY public.tour_images.id;
          public          postgres    false    215            �            1259    17106    tour_locations    TABLE     �   CREATE TABLE public.tour_locations (
    id bigint NOT NULL,
    tour_id bigint NOT NULL,
    location_id bigint NOT NULL,
    date timestamp without time zone NOT NULL
);
 "   DROP TABLE public.tour_locations;
       public         heap    postgres    false            �            1259    17109    TourLocations_id_seq    SEQUENCE        CREATE SEQUENCE public."TourLocations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."TourLocations_id_seq";
       public          postgres    false    216            �           0    0    TourLocations_id_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE public."TourLocations_id_seq" OWNED BY public.tour_locations.id;
          public          postgres    false    217            �            1259    17111 
   tour_types    TABLE     `   CREATE TABLE public.tour_types (
    id bigint NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.tour_types;
       public         heap    postgres    false            �            1259    17117    TourTypes_id_seq    SEQUENCE     {   CREATE SEQUENCE public."TourTypes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."TourTypes_id_seq";
       public          postgres    false    218            �           0    0    TourTypes_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public."TourTypes_id_seq" OWNED BY public.tour_types.id;
          public          postgres    false    219            �            1259    17119    tours    TABLE     8  CREATE TABLE public.tours (
    id bigint NOT NULL,
    name character varying NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    duration integer NOT NULL,
    max_group_size integer NOT NULL,
    price numeric NOT NULL,
    price_discount numeric,
    summary character varying NOT NULL,
    description text NOT NULL,
    tour_type_id bigint,
    active boolean NOT NULL,
    tour_image_cover character varying,
    rating_average numeric,
    number_of_ratings numeric DEFAULT 0,
    guide_id bigint
);
    DROP TABLE public.tours;
       public         heap    postgres    false            �            1259    17126    Tour_id_seq    SEQUENCE     v   CREATE SEQUENCE public."Tour_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Tour_id_seq";
       public          postgres    false    220            �           0    0    Tour_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public."Tour_id_seq" OWNED BY public.tours.id;
          public          postgres    false    221            �            1259    17128    users    TABLE     [  CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    active boolean DEFAULT true,
    avatar_image character varying,
    phone character varying NOT NULL,
    name character varying NOT NULL,
    role_id bigint NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    17135    Users_id_seq    SEQUENCE     w   CREATE SEQUENCE public."Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public          postgres    false    222            �           0    0    Users_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Users_id_seq" OWNED BY public.users.id;
          public          postgres    false    223            �
           2604    17137    bookings id    DEFAULT     l   ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public."Bookings_id_seq"'::regclass);
 :   ALTER TABLE public.bookings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    17138 	   guides id    DEFAULT     h   ALTER TABLE ONLY public.guides ALTER COLUMN id SET DEFAULT nextval('public."Guides_id_seq"'::regclass);
 8   ALTER TABLE public.guides ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    17139    locations id    DEFAULT     n   ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public."Locations_id_seq"'::regclass);
 ;   ALTER TABLE public.locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            �
           2604    17140    review_guides id    DEFAULT     u   ALTER TABLE ONLY public.review_guides ALTER COLUMN id SET DEFAULT nextval('public."ReviewGuides_id_seq"'::regclass);
 ?   ALTER TABLE public.review_guides ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            �
           2604    17141    review_tours id    DEFAULT     o   ALTER TABLE ONLY public.review_tours ALTER COLUMN id SET DEFAULT nextval('public."Reviews_id_seq"'::regclass);
 >   ALTER TABLE public.review_tours ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210            �
           2604    17142    roles id    DEFAULT     f   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212            �
           2604    17143    tour_images id    DEFAULT     q   ALTER TABLE ONLY public.tour_images ALTER COLUMN id SET DEFAULT nextval('public."TourImages_id_seq"'::regclass);
 =   ALTER TABLE public.tour_images ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            �
           2604    17144    tour_locations id    DEFAULT     w   ALTER TABLE ONLY public.tour_locations ALTER COLUMN id SET DEFAULT nextval('public."TourLocations_id_seq"'::regclass);
 @   ALTER TABLE public.tour_locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            �
           2604    17145    tour_types id    DEFAULT     o   ALTER TABLE ONLY public.tour_types ALTER COLUMN id SET DEFAULT nextval('public."TourTypes_id_seq"'::regclass);
 <   ALTER TABLE public.tour_types ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            �
           2604    17146    tours id    DEFAULT     e   ALTER TABLE ONLY public.tours ALTER COLUMN id SET DEFAULT nextval('public."Tour_id_seq"'::regclass);
 7   ALTER TABLE public.tours ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            �
           2604    17147    users id    DEFAULT     f   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222            |          0    17045    bookings 
   TABLE DATA           i   COPY public.bookings (id, tour_id, user_id, created_at, price, paid, quantity, is_cancelled) FROM stdin;
    public          postgres    false    202   Pp       ~          0    17055    guides 
   TABLE DATA           ]   COPY public.guides (id, user_id, description, number_of_ratings, rating_average) FROM stdin;
    public          postgres    false    204   mp       �          0    17064 	   locations 
   TABLE DATA           V   COPY public.locations (id, name, latitude, longitude, address, is_active) FROM stdin;
    public          postgres    false    206   �p       �          0    17072    review_guides 
   TABLE DATA           b   COPY public.review_guides (id, user_id, guide_id, review, rating, created_at, active) FROM stdin;
    public          postgres    false    208   �p       �          0    17081    review_tours 
   TABLE DATA           `   COPY public.review_tours (id, review, rating, user_id, tour_id, created_at, active) FROM stdin;
    public          postgres    false    210   �p       �          0    17090    roles 
   TABLE DATA           )   COPY public.roles (id, name) FROM stdin;
    public          postgres    false    212   �p       �          0    17098    tour_images 
   TABLE DATA           =   COPY public.tour_images (id, tour_id, image_url) FROM stdin;
    public          postgres    false    214   �p       �          0    17106    tour_locations 
   TABLE DATA           H   COPY public.tour_locations (id, tour_id, location_id, date) FROM stdin;
    public          postgres    false    216   q       �          0    17111 
   tour_types 
   TABLE DATA           .   COPY public.tour_types (id, name) FROM stdin;
    public          postgres    false    218   8q       �          0    17119    tours 
   TABLE DATA           �   COPY public.tours (id, name, start_date, end_date, duration, max_group_size, price, price_discount, summary, description, tour_type_id, active, tour_image_cover, rating_average, number_of_ratings, guide_id) FROM stdin;
    public          postgres    false    220   Uq       �          0    17128    users 
   TABLE DATA           j   COPY public.users (id, username, email, password, active, avatar_image, phone, name, role_id) FROM stdin;
    public          postgres    false    222   rq       �           0    0    Bookings_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Bookings_id_seq"', 1, false);
          public          postgres    false    203            �           0    0    Guides_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Guides_id_seq"', 1, false);
          public          postgres    false    205            �           0    0    Locations_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Locations_id_seq"', 1, false);
          public          postgres    false    207            �           0    0    ReviewGuides_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."ReviewGuides_id_seq"', 1, false);
          public          postgres    false    209            �           0    0    Reviews_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Reviews_id_seq"', 1, false);
          public          postgres    false    211            �           0    0    Roles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Roles_id_seq"', 1, false);
          public          postgres    false    213            �           0    0    TourImages_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."TourImages_id_seq"', 1, false);
          public          postgres    false    215            �           0    0    TourLocations_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."TourLocations_id_seq"', 1, false);
          public          postgres    false    217            �           0    0    TourTypes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."TourTypes_id_seq"', 1, false);
          public          postgres    false    219            �           0    0    Tour_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Tour_id_seq"', 1, false);
          public          postgres    false    221            �           0    0    Users_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Users_id_seq"', 1, false);
          public          postgres    false    223            �
           2606    17149    bookings Bookings_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT "Bookings_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.bookings DROP CONSTRAINT "Bookings_pkey";
       public            postgres    false    202            �
           2606    17151    guides Guides_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.guides
    ADD CONSTRAINT "Guides_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.guides DROP CONSTRAINT "Guides_pkey";
       public            postgres    false    204            �
           2606    17153    locations Locations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT "Locations_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.locations DROP CONSTRAINT "Locations_pkey";
       public            postgres    false    206            �
           2606    17155    review_guides ReviewGuides_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.review_guides
    ADD CONSTRAINT "ReviewGuides_pkey" PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.review_guides DROP CONSTRAINT "ReviewGuides_pkey";
       public            postgres    false    208            �
           2606    17157    review_tours Reviews_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.review_tours
    ADD CONSTRAINT "Reviews_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.review_tours DROP CONSTRAINT "Reviews_pkey";
       public            postgres    false    210            �
           2606    17159    roles Roles_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.roles DROP CONSTRAINT "Roles_pkey";
       public            postgres    false    212            �
           2606    17161    tour_images TourImages_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.tour_images
    ADD CONSTRAINT "TourImages_pkey" PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.tour_images DROP CONSTRAINT "TourImages_pkey";
       public            postgres    false    214            �
           2606    17163 !   tour_locations TourLocations_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.tour_locations
    ADD CONSTRAINT "TourLocations_pkey" PRIMARY KEY (id);
 M   ALTER TABLE ONLY public.tour_locations DROP CONSTRAINT "TourLocations_pkey";
       public            postgres    false    216            �
           2606    17165    tour_types TourTypes_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tour_types
    ADD CONSTRAINT "TourTypes_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.tour_types DROP CONSTRAINT "TourTypes_pkey";
       public            postgres    false    218            �
           2606    17167    tours Tour_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.tours
    ADD CONSTRAINT "Tour_pkey" PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.tours DROP CONSTRAINT "Tour_pkey";
       public            postgres    false    220            �
           2606    17169    users Users_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_email_key";
       public            postgres    false    222            �
           2606    17171    users Users_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_pkey";
       public            postgres    false    222            �
           2606    17173    users Users_username_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_username_key";
       public            postgres    false    222            �
           2606    17174    bookings Bookings_tourId_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT "Bookings_tourId_fkey" FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 I   ALTER TABLE ONLY public.bookings DROP CONSTRAINT "Bookings_tourId_fkey";
       public          postgres    false    220    2794    202            �
           2606    17179    bookings Bookings_userId_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT "Bookings_userId_fkey" FOREIGN KEY (user_id) REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.bookings DROP CONSTRAINT "Bookings_userId_fkey";
       public          postgres    false    2798    202    222            �
           2606    17184    guides Guides_userId_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.guides
    ADD CONSTRAINT "Guides_userId_fkey" FOREIGN KEY (user_id) REFERENCES public.users(id);
 E   ALTER TABLE ONLY public.guides DROP CONSTRAINT "Guides_userId_fkey";
       public          postgres    false    2798    204    222            �
           2606    17189 '   review_guides ReviewGuides_guideId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review_guides
    ADD CONSTRAINT "ReviewGuides_guideId_fkey" FOREIGN KEY (guide_id) REFERENCES public.guides(id);
 S   ALTER TABLE ONLY public.review_guides DROP CONSTRAINT "ReviewGuides_guideId_fkey";
       public          postgres    false    208    2778    204            �
           2606    17194 &   review_guides ReviewGuides_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review_guides
    ADD CONSTRAINT "ReviewGuides_userId_fkey" FOREIGN KEY (user_id) REFERENCES public.users(id);
 R   ALTER TABLE ONLY public.review_guides DROP CONSTRAINT "ReviewGuides_userId_fkey";
       public          postgres    false    208    2798    222            �
           2606    17199     review_tours Reviews_tourId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review_tours
    ADD CONSTRAINT "Reviews_tourId_fkey" FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 L   ALTER TABLE ONLY public.review_tours DROP CONSTRAINT "Reviews_tourId_fkey";
       public          postgres    false    210    2794    220            �
           2606    17204     review_tours Reviews_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review_tours
    ADD CONSTRAINT "Reviews_userId_fkey" FOREIGN KEY (user_id) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.review_tours DROP CONSTRAINT "Reviews_userId_fkey";
       public          postgres    false    210    2798    222            �
           2606    17209 "   tour_images TourImages_tourId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tour_images
    ADD CONSTRAINT "TourImages_tourId_fkey" FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 N   ALTER TABLE ONLY public.tour_images DROP CONSTRAINT "TourImages_tourId_fkey";
       public          postgres    false    220    214    2794            �
           2606    17214 ,   tour_locations TourLocations_locationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tour_locations
    ADD CONSTRAINT "TourLocations_locationId_fkey" FOREIGN KEY (location_id) REFERENCES public.locations(id) NOT VALID;
 X   ALTER TABLE ONLY public.tour_locations DROP CONSTRAINT "TourLocations_locationId_fkey";
       public          postgres    false    216    2780    206            �
           2606    17219 (   tour_locations TourLocations_tourId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tour_locations
    ADD CONSTRAINT "TourLocations_tourId_fkey" FOREIGN KEY (tour_id) REFERENCES public.tours(id) NOT VALID;
 T   ALTER TABLE ONLY public.tour_locations DROP CONSTRAINT "TourLocations_tourId_fkey";
       public          postgres    false    216    220    2794            �
           2606    17224    tours Tours_guideId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tours
    ADD CONSTRAINT "Tours_guideId_fkey" FOREIGN KEY (guide_id) REFERENCES public.guides(id) NOT VALID;
 D   ALTER TABLE ONLY public.tours DROP CONSTRAINT "Tours_guideId_fkey";
       public          postgres    false    2778    220    204            �
           2606    17229    tours Tours_tourTypeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tours
    ADD CONSTRAINT "Tours_tourTypeId_fkey" FOREIGN KEY (tour_type_id) REFERENCES public.tour_types(id) NOT VALID;
 G   ALTER TABLE ONLY public.tours DROP CONSTRAINT "Tours_tourTypeId_fkey";
       public          postgres    false    220    2792    218            �
           2606    17234    users Users_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_roleId_fkey" FOREIGN KEY (role_id) REFERENCES public.roles(id) NOT VALID;
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_roleId_fkey";
       public          postgres    false    2786    212    222            |      x������ � �      ~      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     