PGDMP     :                    w            cartdb    11.5    11.5     %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            (           1262    33005    cartdb    DATABASE     �   CREATE DATABASE cartdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE cartdb;
             Norman    false            �            1259    33006    cart    TABLE     �   CREATE TABLE public.cart (
    id integer NOT NULL,
    subtotal numeric(8,2) NOT NULL,
    discount numeric(8,2) NOT NULL,
    total numeric(8,2) NOT NULL,
    shipping numeric(8,2) NOT NULL,
    "userId" integer
);
    DROP TABLE public.cart;
       public         Norman    false            �            1259    33009    cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public       Norman    false    196            )           0    0    cart_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;
            public       Norman    false    197            �            1259    33011    cart_product    TABLE     �   CREATE TABLE public.cart_product (
    id integer NOT NULL,
    quantity integer NOT NULL,
    total numeric(8,2) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "productId" integer,
    "cartId" integer
);
     DROP TABLE public.cart_product;
       public         Norman    false            �            1259    33015    cart_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.cart_product_id_seq;
       public       Norman    false    198            *           0    0    cart_product_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.cart_product_id_seq OWNED BY public.cart_product.id;
            public       Norman    false    199            �            1259    33017    product    TABLE     !  CREATE TABLE public.product (
    id integer NOT NULL,
    name text NOT NULL,
    price numeric(8,2) NOT NULL,
    "salePrice" numeric(8,2) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.product;
       public         Norman    false            �            1259    33025    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public       Norman    false    200            +           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
            public       Norman    false    201            �            1259    33027    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public."user";
       public         Norman    false            �            1259    33034    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       Norman    false    202            ,           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
            public       Norman    false    203            �
           2604    33036    cart id    DEFAULT     b   ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public       Norman    false    197    196            �
           2604    33037    cart_product id    DEFAULT     r   ALTER TABLE ONLY public.cart_product ALTER COLUMN id SET DEFAULT nextval('public.cart_product_id_seq'::regclass);
 >   ALTER TABLE public.cart_product ALTER COLUMN id DROP DEFAULT;
       public       Norman    false    199    198            �
           2604    33038 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public       Norman    false    201    200            �
           2604    33039    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       Norman    false    203    202            �
           2606    33041 &   product PK_bebc9158e480b949565b4dc7a82 
   CONSTRAINT     f   ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_bebc9158e480b949565b4dc7a82" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.product DROP CONSTRAINT "PK_bebc9158e480b949565b4dc7a82";
       public         Norman    false    200            �
           2606    33043 #   cart PK_c524ec48751b9b5bcfbf6e59be7 
   CONSTRAINT     c   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "PK_c524ec48751b9b5bcfbf6e59be7" PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.cart DROP CONSTRAINT "PK_c524ec48751b9b5bcfbf6e59be7";
       public         Norman    false    196            �
           2606    33045 #   user PK_cace4a159ff9f2512dd42373760 
   CONSTRAINT     e   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "PK_cace4a159ff9f2512dd42373760";
       public         Norman    false    202            �
           2606    33047 +   cart_product PK_dccd1ec2d6f5644a69adf163bc1 
   CONSTRAINT     k   ALTER TABLE ONLY public.cart_product
    ADD CONSTRAINT "PK_dccd1ec2d6f5644a69adf163bc1" PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.cart_product DROP CONSTRAINT "PK_dccd1ec2d6f5644a69adf163bc1";
       public         Norman    false    198            �
           2606    33049 #   cart REL_756f53ab9466eb52a52619ee01 
   CONSTRAINT     d   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "REL_756f53ab9466eb52a52619ee01" UNIQUE ("userId");
 O   ALTER TABLE ONLY public.cart DROP CONSTRAINT "REL_756f53ab9466eb52a52619ee01";
       public         Norman    false    196            �
           2606    33051 &   product UQ_22cc43e9a74d7498546e9a63e77 
   CONSTRAINT     c   ALTER TABLE ONLY public.product
    ADD CONSTRAINT "UQ_22cc43e9a74d7498546e9a63e77" UNIQUE (name);
 R   ALTER TABLE ONLY public.product DROP CONSTRAINT "UQ_22cc43e9a74d7498546e9a63e77";
       public         Norman    false    200            �
           2606    33053 #   user UQ_e12875dfb3b1d92d7d7c5377e22 
   CONSTRAINT     c   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_e12875dfb3b1d92d7d7c5377e22" UNIQUE (email);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "UQ_e12875dfb3b1d92d7d7c5377e22";
       public         Norman    false    202            �
           2606    33054 +   cart_product FK_139f8024067696fe5a8400ebda2    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_product
    ADD CONSTRAINT "FK_139f8024067696fe5a8400ebda2" FOREIGN KEY ("cartId") REFERENCES public.cart(id);
 W   ALTER TABLE ONLY public.cart_product DROP CONSTRAINT "FK_139f8024067696fe5a8400ebda2";
       public       Norman    false    196    2714    198            �
           2606    33059 +   cart_product FK_4f1b0c66f4e0b4610e14ca42e5c    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_product
    ADD CONSTRAINT "FK_4f1b0c66f4e0b4610e14ca42e5c" FOREIGN KEY ("productId") REFERENCES public.product(id);
 W   ALTER TABLE ONLY public.cart_product DROP CONSTRAINT "FK_4f1b0c66f4e0b4610e14ca42e5c";
       public       Norman    false    198    200    2720            �
           2606    33064 #   cart FK_756f53ab9466eb52a52619ee019    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_756f53ab9466eb52a52619ee019" FOREIGN KEY ("userId") REFERENCES public."user"(id);
 O   ALTER TABLE ONLY public.cart DROP CONSTRAINT "FK_756f53ab9466eb52a52619ee019";
       public       Norman    false    202    2724    196           