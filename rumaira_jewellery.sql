PGDMP                       }            rumaira_jewellery    17.5    17.5 p    [           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            \           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            ]           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            ^           1262    16646    rumaira_jewellery    DATABASE     �   CREATE DATABASE rumaira_jewellery WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
 !   DROP DATABASE rumaira_jewellery;
                     postgres    false            �            1259    16668    brands    TABLE     �   CREATE TABLE public.brands (
    id bigint NOT NULL,
    name character varying(50),
    added_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.brands;
       public         heap r       postgres    false            �            1259    16667    brands_id_seq    SEQUENCE     v   CREATE SEQUENCE public.brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.brands_id_seq;
       public               postgres    false    222            _           0    0    brands_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;
          public               postgres    false    221            �            1259    16700 
   cart_items    TABLE     �   CREATE TABLE public.cart_items (
    id bigint NOT NULL,
    user_id integer,
    product_id integer,
    quantity integer,
    added_date timestamp without time zone
);
    DROP TABLE public.cart_items;
       public         heap r       postgres    false            �            1259    16699    cart_items_id_seq    SEQUENCE     z   CREATE SEQUENCE public.cart_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.cart_items_id_seq;
       public               postgres    false    228            `           0    0    cart_items_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;
          public               postgres    false    227            �            1259    16677 
   categories    TABLE     $  CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(100),
    description text,
    added_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    cat_image_url character varying
);
    DROP TABLE public.categories;
       public         heap r       postgres    false            �            1259    16676    categories_id_seq    SEQUENCE     z   CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public               postgres    false    224            a           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public               postgres    false    223            �            1259    16744    chat_messages    TABLE     �   CREATE TABLE public.chat_messages (
    id integer NOT NULL,
    room_id character varying NOT NULL,
    sender_id uuid NOT NULL,
    message text NOT NULL,
    added_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.chat_messages;
       public         heap r       postgres    false            �            1259    16743    chat_messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chat_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.chat_messages_id_seq;
       public               postgres    false    238            b           0    0    chat_messages_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.chat_messages_id_seq OWNED BY public.chat_messages.id;
          public               postgres    false    237            �            1259    17033 	   enquiries    TABLE     �   CREATE TABLE public.enquiries (
    id bigint NOT NULL,
    monthly_amt double precision,
    mobile_no character varying(10),
    added_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.enquiries;
       public         heap r       postgres    false            �            1259    17032    enquiries_id_seq    SEQUENCE     y   CREATE SEQUENCE public.enquiries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.enquiries_id_seq;
       public               postgres    false    244            c           0    0    enquiries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.enquiries_id_seq OWNED BY public.enquiries.id;
          public               postgres    false    243            �            1259    17041    nominee_details    TABLE     �   CREATE TABLE public.nominee_details (
    id bigint NOT NULL,
    nominee_name character varying,
    relationship character varying,
    nationality character varying,
    added_date timestamp without time zone
);
 #   DROP TABLE public.nominee_details;
       public         heap r       postgres    false            �            1259    17040    nominee_details_id_seq    SEQUENCE        CREATE SEQUENCE public.nominee_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.nominee_details_id_seq;
       public               postgres    false    246            d           0    0    nominee_details_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.nominee_details_id_seq OWNED BY public.nominee_details.id;
          public               postgres    false    245            �            1259    16733    notifications    TABLE     �   CREATE TABLE public.notifications (
    id bigint NOT NULL,
    type character varying,
    message text,
    is_read boolean DEFAULT false,
    added_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    to_user_id bigint
);
 !   DROP TABLE public.notifications;
       public         heap r       postgres    false            �            1259    16732    notifications_id_seq    SEQUENCE     }   CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.notifications_id_seq;
       public               postgres    false    236            e           0    0    notifications_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;
          public               postgres    false    235            �            1259    16837    orders    TABLE     y  CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    razorpay_order_id character varying(255) NOT NULL,
    amount numeric(10,2) NOT NULL,
    currency character varying(10) DEFAULT 'INR'::character varying,
    status character varying(50) DEFAULT 'created'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.orders;
       public         heap r       postgres    false            �            1259    16723    orders_payment    TABLE     �  CREATE TABLE public.orders_payment (
    id bigint NOT NULL,
    user_id integer,
    total_price double precision,
    status character varying,
    product_id integer,
    quantity integer,
    added_date timestamp without time zone,
    CONSTRAINT chk_order_status CHECK (((status)::text = ANY (ARRAY[('pending'::character varying)::text, ('shipped'::character varying)::text, ('delivered'::character varying)::text, ('cancelled'::character varying)::text])))
);
 "   DROP TABLE public.orders_payment;
       public         heap r       postgres    false            �            1259    16722    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public               postgres    false    234            f           0    0    orders_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders_payment.id;
          public               postgres    false    233            �            1259    16836    orders_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.orders_id_seq1;
       public               postgres    false    242            g           0    0    orders_id_seq1    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.orders_id_seq1 OWNED BY public.orders.id;
          public               postgres    false    241            �            1259    16829    payment    TABLE     "  CREATE TABLE public.payment (
    id integer NOT NULL,
    user_id integer,
    razorpay_order_id character varying(255),
    amount numeric(10,2),
    currency character varying(10),
    status character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.payment;
       public         heap r       postgres    false            �            1259    16828    payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.payment_id_seq;
       public               postgres    false    240            h           0    0    payment_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;
          public               postgres    false    239            �            1259    16688    product    TABLE     �  CREATE TABLE public.product (
    id bigint NOT NULL,
    name character varying(100),
    description_product text,
    price double precision,
    category_id integer,
    brand_id integer,
    material character varying(100),
    weight double precision,
    stock_quantity integer DEFAULT 0,
    image_url character varying(250),
    added_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    discount double precision
);
    DROP TABLE public.product;
       public         heap r       postgres    false            �            1259    16687    product_id_seq    SEQUENCE     w   CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public               postgres    false    226            i           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public               postgres    false    225            �            1259    16657    profile_users    TABLE     x  CREATE TABLE public.profile_users (
    id bigint NOT NULL,
    name character varying(50),
    email character varying(50),
    mobile character varying(10),
    address text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    city character varying,
    state character varying
);
 !   DROP TABLE public.profile_users;
       public         heap r       postgres    false            �            1259    16656    profile_users_id_seq    SEQUENCE     }   CREATE SEQUENCE public.profile_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.profile_users_id_seq;
       public               postgres    false    220            j           0    0    profile_users_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.profile_users_id_seq OWNED BY public.profile_users.id;
          public               postgres    false    219            �            1259    16714    reviews    TABLE     �   CREATE TABLE public.reviews (
    id bigint NOT NULL,
    user_id integer,
    product_id integer,
    rating character varying(5),
    review_text text,
    added_date timestamp without time zone,
    update_date timestamp without time zone
);
    DROP TABLE public.reviews;
       public         heap r       postgres    false            �            1259    16713    reviews_id_seq    SEQUENCE     w   CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reviews_id_seq;
       public               postgres    false    232            k           0    0    reviews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;
          public               postgres    false    231            �            1259    16648    users    TABLE     �   CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(50),
    email character varying(50),
    password text
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16647    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public               postgres    false    218            l           0    0    user_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE public.user_id_seq OWNED BY public.users.id;
          public               postgres    false    217            �            1259    16707    wishlist_items    TABLE     �   CREATE TABLE public.wishlist_items (
    id bigint NOT NULL,
    user_id integer,
    product_id integer,
    added_date timestamp without time zone
);
 "   DROP TABLE public.wishlist_items;
       public         heap r       postgres    false            �            1259    16706    wishlist_items_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.wishlist_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.wishlist_items_id_seq;
       public               postgres    false    230            m           0    0    wishlist_items_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.wishlist_items_id_seq OWNED BY public.wishlist_items.id;
          public               postgres    false    229            k           2604    16671 	   brands id    DEFAULT     f   ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);
 8   ALTER TABLE public.brands ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            u           2604    16703    cart_items id    DEFAULT     n   ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);
 <   ALTER TABLE public.cart_items ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    227    228    228            n           2604    16680    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    224    224            |           2604    16747    chat_messages id    DEFAULT     t   ALTER TABLE ONLY public.chat_messages ALTER COLUMN id SET DEFAULT nextval('public.chat_messages_id_seq'::regclass);
 ?   ALTER TABLE public.chat_messages ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    238    237    238            �           2604    17036    enquiries id    DEFAULT     l   ALTER TABLE ONLY public.enquiries ALTER COLUMN id SET DEFAULT nextval('public.enquiries_id_seq'::regclass);
 ;   ALTER TABLE public.enquiries ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    244    243    244            �           2604    17044    nominee_details id    DEFAULT     x   ALTER TABLE ONLY public.nominee_details ALTER COLUMN id SET DEFAULT nextval('public.nominee_details_id_seq'::regclass);
 A   ALTER TABLE public.nominee_details ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    245    246    246            y           2604    16736    notifications id    DEFAULT     t   ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);
 ?   ALTER TABLE public.notifications ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    236    235    236            �           2604    16840 	   orders id    DEFAULT     g   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq1'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    241    242    242            x           2604    16726    orders_payment id    DEFAULT     n   ALTER TABLE ONLY public.orders_payment ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 @   ALTER TABLE public.orders_payment ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    234    233    234            ~           2604    16832 
   payment id    DEFAULT     h   ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);
 9   ALTER TABLE public.payment ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    240    239    240            q           2604    16691 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    226    226            h           2604    16660    profile_users id    DEFAULT     t   ALTER TABLE ONLY public.profile_users ALTER COLUMN id SET DEFAULT nextval('public.profile_users_id_seq'::regclass);
 ?   ALTER TABLE public.profile_users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            w           2604    16717 
   reviews id    DEFAULT     h   ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);
 9   ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    231    232    232            g           2604    16651    users id    DEFAULT     c   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            v           2604    16710    wishlist_items id    DEFAULT     v   ALTER TABLE ONLY public.wishlist_items ALTER COLUMN id SET DEFAULT nextval('public.wishlist_items_id_seq'::regclass);
 @   ALTER TABLE public.wishlist_items ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    230    230            @          0    16668    brands 
   TABLE DATA           D   COPY public.brands (id, name, added_date, updated_date) FROM stdin;
    public               postgres    false    222    �       F          0    16700 
   cart_items 
   TABLE DATA           S   COPY public.cart_items (id, user_id, product_id, quantity, added_date) FROM stdin;
    public               postgres    false    228   N�       B          0    16677 
   categories 
   TABLE DATA           c   COPY public.categories (id, name, description, added_date, update_date, cat_image_url) FROM stdin;
    public               postgres    false    224   |�       P          0    16744    chat_messages 
   TABLE DATA           T   COPY public.chat_messages (id, room_id, sender_id, message, added_date) FROM stdin;
    public               postgres    false    238   �       V          0    17033 	   enquiries 
   TABLE DATA           K   COPY public.enquiries (id, monthly_amt, mobile_no, added_date) FROM stdin;
    public               postgres    false    244   ��       X          0    17041    nominee_details 
   TABLE DATA           b   COPY public.nominee_details (id, nominee_name, relationship, nationality, added_date) FROM stdin;
    public               postgres    false    246   ��       N          0    16733    notifications 
   TABLE DATA           [   COPY public.notifications (id, type, message, is_read, added_date, to_user_id) FROM stdin;
    public               postgres    false    236   ��       T          0    16837    orders 
   TABLE DATA           f   COPY public.orders (id, user_id, razorpay_order_id, amount, currency, status, created_at) FROM stdin;
    public               postgres    false    242   ݄       L          0    16723    orders_payment 
   TABLE DATA           l   COPY public.orders_payment (id, user_id, total_price, status, product_id, quantity, added_date) FROM stdin;
    public               postgres    false    234   �       R          0    16829    payment 
   TABLE DATA           g   COPY public.payment (id, user_id, razorpay_order_id, amount, currency, status, created_at) FROM stdin;
    public               postgres    false    240   B�       D          0    16688    product 
   TABLE DATA           �   COPY public.product (id, name, description_product, price, category_id, brand_id, material, weight, stock_quantity, image_url, added_date, update_date, discount) FROM stdin;
    public               postgres    false    226   ��       >          0    16657    profile_users 
   TABLE DATA           n   COPY public.profile_users (id, name, email, mobile, address, created_at, updated_at, city, state) FROM stdin;
    public               postgres    false    220   ��       J          0    16714    reviews 
   TABLE DATA           h   COPY public.reviews (id, user_id, product_id, rating, review_text, added_date, update_date) FROM stdin;
    public               postgres    false    232   �       <          0    16648    users 
   TABLE DATA           :   COPY public.users (id, name, email, password) FROM stdin;
    public               postgres    false    218   -�       H          0    16707    wishlist_items 
   TABLE DATA           M   COPY public.wishlist_items (id, user_id, product_id, added_date) FROM stdin;
    public               postgres    false    230   ��       n           0    0    brands_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.brands_id_seq', 2, true);
          public               postgres    false    221            o           0    0    cart_items_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cart_items_id_seq', 13, true);
          public               postgres    false    227            p           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 4, true);
          public               postgres    false    223            q           0    0    chat_messages_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.chat_messages_id_seq', 4, true);
          public               postgres    false    237            r           0    0    enquiries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.enquiries_id_seq', 1, false);
          public               postgres    false    243            s           0    0    nominee_details_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.nominee_details_id_seq', 1, false);
          public               postgres    false    245            t           0    0    notifications_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.notifications_id_seq', 12, true);
          public               postgres    false    235            u           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 1, true);
          public               postgres    false    233            v           0    0    orders_id_seq1    SEQUENCE SET     =   SELECT pg_catalog.setval('public.orders_id_seq1', 20, true);
          public               postgres    false    241            w           0    0    payment_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.payment_id_seq', 21, true);
          public               postgres    false    239            x           0    0    product_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.product_id_seq', 7, true);
          public               postgres    false    225            y           0    0    profile_users_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.profile_users_id_seq', 9, true);
          public               postgres    false    219            z           0    0    reviews_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.reviews_id_seq', 1, true);
          public               postgres    false    231            {           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 1, true);
          public               postgres    false    217            |           0    0    wishlist_items_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.wishlist_items_id_seq', 48, true);
          public               postgres    false    229            �           2606    16673    brands brands_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.brands DROP CONSTRAINT brands_pkey;
       public                 postgres    false    222            �           2606    16705    cart_items cart_items_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.cart_items DROP CONSTRAINT cart_items_pkey;
       public                 postgres    false    228            �           2606    16684    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public                 postgres    false    224            �           2606    16751     chat_messages chat_messages_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.chat_messages DROP CONSTRAINT chat_messages_pkey;
       public                 postgres    false    238            �           2606    17039    enquiries enquiries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.enquiries
    ADD CONSTRAINT enquiries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.enquiries DROP CONSTRAINT enquiries_pkey;
       public                 postgres    false    244            �           2606    17048 $   nominee_details nominee_details_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.nominee_details
    ADD CONSTRAINT nominee_details_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.nominee_details DROP CONSTRAINT nominee_details_pkey;
       public                 postgres    false    246            �           2606    16740     notifications notifications_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public                 postgres    false    236            �           2606    16730    orders_payment orders_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.orders_payment
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.orders_payment DROP CONSTRAINT orders_pkey;
       public                 postgres    false    234            �           2606    16845    orders orders_pkey1 
   CONSTRAINT     Q   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey1 PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey1;
       public                 postgres    false    242            �           2606    16847 #   orders orders_razorpay_order_id_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_razorpay_order_id_key UNIQUE (razorpay_order_id);
 M   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_razorpay_order_id_key;
       public                 postgres    false    242            �           2606    16834    payment payment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public                 postgres    false    240            �           2606    16696    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public                 postgres    false    226            �           2606    16664     profile_users profile_users_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.profile_users
    ADD CONSTRAINT profile_users_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.profile_users DROP CONSTRAINT profile_users_pkey;
       public                 postgres    false    220            �           2606    16721    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public                 postgres    false    232            �           2606    16655    users user_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pkey;
       public                 postgres    false    218            �           2606    16712 "   wishlist_items wishlist_items_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.wishlist_items
    ADD CONSTRAINT wishlist_items_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.wishlist_items DROP CONSTRAINT wishlist_items_pkey;
       public                 postgres    false    230            �           2606    16765    notifications fk_to_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_to_user FOREIGN KEY (to_user_id) REFERENCES public.profile_users(id);
 B   ALTER TABLE ONLY public.notifications DROP CONSTRAINT fk_to_user;
       public               postgres    false    236    220    4747            �           2606    16848    orders orders_user_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_fkey;
       public               postgres    false    4745    218    242            @   >   x�3��I��,�HT�J-O��I-��4202�50�5�T04�2��20г4�46��#����� /��      F      x�34�4BC�?.Cc ����� B�]      B   �   x�3�H�KI�+)���4202�50�50R04�2��2��3�024�#SZ����R���X���_��Z�_ 1R� /�˄�5��(3/���B�[`�drFDD@�0�5��adde`�ghaahl�O
��p�c���� )UL�      P   e   x�����  �7�(���a�`b��Kl��y�p o�cs��8z�T�\�R �n�w�۩��z�y:*Þk�2Y�Dm��"E ��Ⓢ�� U�0�      V      x������ � �      X      x������ � �      N      x������ � �      T     x����n1����S��<��t�@9 U�
C(����$O_���+�eo���z�!�d[�}�q���[�=L�&�~� c����&U��?O��l1�Bu�I�8Rm4HM�7s�My�����h�wH�@^�p�8��5L)$<�t���+^��i#�: jAH"b(��B�W�r�@R;&(
&�%2���|�f�)�,�C2(N
j��ZC#U.����`�t�R.�Kt-�Pg�J�{��{g�D�,e�0�DLv9�ۧtս���?\�
˗@A���j��U�.�=�F8j���"`���=�5L��wHʡuN#
�	@$�W�b}�_֏�M$�� �ހ �!M��3>����d��f�@ܶ�eu(�q�PWg�p���q�t�%�@�oO���^:"�k"�phB���p��n�yΎ�K����I:��4�(����Q�/׷��k����@���}>��G��n��F��d��+q������T��$N�3��Iq��f�ޕ׳Y�j$�:�F1�H0N|���M����8</���8�3aP�|���￶r	      L   &   x�3�4�414721�,H�K��K�4
��q��qqq j_o      R   7  x����n�0��k�}�Z>��I�KK>(��4i�`(�H3���g�M�m�>��9��@Z�j����6�������PA��B�z�Q��ܴv�
��Α� ��F.���a���@l���C��f��2�H��a�7S�hS��,U�I��#�w(:}ʪ�[� *�B(�6�})�*i���t%�\��2_�\H�!i�"�(t�u�JRxJ:�ӎ���*"�И�E>�̚@�VI�*RJ�8��f���>���}e���@�b&`ҋ�U�z���y����^ϣd��Pj��U�,��e�$�<�X��Ү��T�����@"��J?F?"�R�u�]����frQݿ5��x̉�"d ��������]�T2��H�1��m�˲.�0����m���
�� ¶]{jv��Q�M����Ǹ!��u^�=���Ɂ���U�w��0o�K�%�^���&�VE��0��¾]6���Tv7�I#	�aJaH�0qW�׷�n��������Z�P�0qw�^٬?]5������o_ne{��̋8�NK~/��� -%��c����      D     x����N�0��O��z΁��k/L�q�s^�4��0����A j6�,mړ��}-����ח�b��mQvN<��Nʾ7e���9Pr'vM��n��1���׭�!�
Ὥ�,�_���!Ƀ{i��U�:$+H��i��I���m�6���uuV�͡��_� ⣉�}J��k��#A��M�H�$ژ��kİʺ�h`*��Ӎ��>�(�D����y����0_����<������W��n��<LO�:_���S@���F��x)�nfr�$����Ɨ�me�`��*      >   I   x�3���L�,�L�Ff鹉�9z��� 9 2202�50�52Q0��24�2��330777�'������ J�      J      x������ � �      <   a   x�3�N��J��R�F�鹉�9z����*F�*�*Uƙ�eFI�e!)9����9n��%Q��ξ��e�E�9����Y�N!���&�\1z\\\ ��t      H      x�31�4�4���21�A +F��� 5��     