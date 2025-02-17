PGDMP         
                {            warehouse_db    14.7    14.7 0    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            @           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            A           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            B           1262    16697    warehouse_db    DATABASE     i   CREATE DATABASE warehouse_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE warehouse_db;
                postgres    false                        2615    16698 	   warehouse    SCHEMA        CREATE SCHEMA warehouse;
    DROP SCHEMA warehouse;
                postgres    false            �            1259    16699    buyer_company    TABLE     �   CREATE TABLE warehouse.buyer_company (
    organization_code integer NOT NULL,
    company_name character varying(30) NOT NULL,
    buyer_company_address character varying(100) NOT NULL
);
 $   DROP TABLE warehouse.buyer_company;
    	   warehouse         heap    postgres    false    5            �            1259    16702    item    TABLE     �  CREATE TABLE warehouse.item (
    item_code integer NOT NULL,
    item_type character varying(30) NOT NULL,
    unit_measurement character varying(10) NOT NULL,
    expiration_date date NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT expiration_check CHECK (((expiration_date > '2000-01-01'::date) AND (expiration_date < '2030-12-31'::date)))
);
    DROP TABLE warehouse.item;
    	   warehouse         heap    postgres    false    5            �            1259    16706    manager    TABLE     �   CREATE TABLE warehouse.manager (
    employee_code integer NOT NULL,
    service_number integer NOT NULL,
    "position" character varying(15) NOT NULL,
    passport_data bigint NOT NULL
);
    DROP TABLE warehouse.manager;
    	   warehouse         heap    postgres    false    5            �            1259    16709    purchase_item    TABLE       CREATE TABLE warehouse.purchase_item (
    shipping_code integer NOT NULL,
    item integer NOT NULL,
    purchase_price integer NOT NULL,
    item_quantity integer NOT NULL,
    purchase_item integer NOT NULL,
    CONSTRAINT quantity_check CHECK ((item_quantity > 0))
);
 $   DROP TABLE warehouse.purchase_item;
    	   warehouse         heap    postgres    false    5            �            1259    16713    sale    TABLE     �  CREATE TABLE warehouse.sale (
    lot_number integer NOT NULL,
    employee_code integer NOT NULL,
    organization_code integer NOT NULL,
    export_date date NOT NULL,
    order_date date NOT NULL,
    CONSTRAINT export_check CHECK (((export_date > '2000-01-01'::date) AND (export_date < '2030-12-31'::date))),
    CONSTRAINT order_check CHECK (((order_date > '2000-01-01'::date) AND (order_date < '2030-12-31'::date)))
);
    DROP TABLE warehouse.sale;
    	   warehouse         heap    postgres    false    5            �            1259    16718 
   sales_item    TABLE     �   CREATE TABLE warehouse.sales_item (
    sales_code integer NOT NULL,
    delivered_item integer NOT NULL,
    price_for_sale integer NOT NULL,
    product_quantity integer NOT NULL
);
 !   DROP TABLE warehouse.sales_item;
    	   warehouse         heap    postgres    false    5            �            1259    16721    shipping    TABLE     (  CREATE TABLE warehouse.shipping (
    shipping_code integer NOT NULL,
    employee_code integer NOT NULL,
    supplier_code integer NOT NULL,
    delivery_date date NOT NULL,
    CONSTRAINT delivery_check CHECK (((delivery_date > '2000-01-01'::date) AND (delivery_date < '2030-12-31'::date)))
);
    DROP TABLE warehouse.shipping;
    	   warehouse         heap    postgres    false    5            �            1259    16725    storage    TABLE        CREATE TABLE warehouse.storage (
    storage_code integer NOT NULL,
    item_residue integer NOT NULL,
    location character varying(100) NOT NULL,
    item_code integer NOT NULL,
    purchase_item integer NOT NULL,
    delivered_item integer NOT NULL
);
    DROP TABLE warehouse.storage;
    	   warehouse         heap    postgres    false    5            �            1259    16728    supplier_company    TABLE     �   CREATE TABLE warehouse.supplier_company (
    supplier_code integer NOT NULL,
    supplier_account_number integer NOT NULL,
    supplier_company_name character varying(30) NOT NULL,
    supplier_address character varying(100) NOT NULL
);
 '   DROP TABLE warehouse.supplier_company;
    	   warehouse         heap    postgres    false    5            4          0    16699    buyer_company 
   TABLE DATA           b   COPY warehouse.buyer_company (organization_code, company_name, buyer_company_address) FROM stdin;
 	   warehouse          postgres    false    210   �>       5          0    16702    item 
   TABLE DATA           m   COPY warehouse.item (item_code, item_type, unit_measurement, expiration_date, name, description) FROM stdin;
 	   warehouse          postgres    false    211   �?       6          0    16706    manager 
   TABLE DATA           ^   COPY warehouse.manager (employee_code, service_number, "position", passport_data) FROM stdin;
 	   warehouse          postgres    false    212   �@       7          0    16709    purchase_item 
   TABLE DATA           m   COPY warehouse.purchase_item (shipping_code, item, purchase_price, item_quantity, purchase_item) FROM stdin;
 	   warehouse          postgres    false    213   ;A       8          0    16713    sale 
   TABLE DATA           h   COPY warehouse.sale (lot_number, employee_code, organization_code, export_date, order_date) FROM stdin;
 	   warehouse          postgres    false    214   �A       9          0    16718 
   sales_item 
   TABLE DATA           e   COPY warehouse.sales_item (sales_code, delivered_item, price_for_sale, product_quantity) FROM stdin;
 	   warehouse          postgres    false    215   �A       :          0    16721    shipping 
   TABLE DATA           a   COPY warehouse.shipping (shipping_code, employee_code, supplier_code, delivery_date) FROM stdin;
 	   warehouse          postgres    false    216   EB       ;          0    16725    storage 
   TABLE DATA           t   COPY warehouse.storage (storage_code, item_residue, location, item_code, purchase_item, delivered_item) FROM stdin;
 	   warehouse          postgres    false    217   �B       <          0    16728    supplier_company 
   TABLE DATA           ~   COPY warehouse.supplier_company (supplier_code, supplier_account_number, supplier_company_name, supplier_address) FROM stdin;
 	   warehouse          postgres    false    218   �C       �           2606    16732     buyer_company buyer_company_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY warehouse.buyer_company
    ADD CONSTRAINT buyer_company_pkey PRIMARY KEY (organization_code);
 M   ALTER TABLE ONLY warehouse.buyer_company DROP CONSTRAINT buyer_company_pkey;
    	   warehouse            postgres    false    210            �           2606    16734    item item_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY warehouse.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (item_code);
 ;   ALTER TABLE ONLY warehouse.item DROP CONSTRAINT item_pkey;
    	   warehouse            postgres    false    211            �           2606    16736    manager manager_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY warehouse.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (employee_code);
 A   ALTER TABLE ONLY warehouse.manager DROP CONSTRAINT manager_pkey;
    	   warehouse            postgres    false    212            �           2606    16831     purchase_item purchase_item_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY warehouse.purchase_item
    ADD CONSTRAINT purchase_item_pkey PRIMARY KEY (purchase_item);
 M   ALTER TABLE ONLY warehouse.purchase_item DROP CONSTRAINT purchase_item_pkey;
    	   warehouse            postgres    false    213            �           2606    16738    sale sale_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY warehouse.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (lot_number);
 ;   ALTER TABLE ONLY warehouse.sale DROP CONSTRAINT sale_pkey;
    	   warehouse            postgres    false    214            �           2606    16838    sales_item sales_item_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY warehouse.sales_item
    ADD CONSTRAINT sales_item_pkey PRIMARY KEY (delivered_item);
 G   ALTER TABLE ONLY warehouse.sales_item DROP CONSTRAINT sales_item_pkey;
    	   warehouse            postgres    false    215            �           2606    16740    shipping shipping_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY warehouse.shipping
    ADD CONSTRAINT shipping_pkey PRIMARY KEY (shipping_code);
 C   ALTER TABLE ONLY warehouse.shipping DROP CONSTRAINT shipping_pkey;
    	   warehouse            postgres    false    216            �           2606    16742    storage storage_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY warehouse.storage
    ADD CONSTRAINT storage_pkey PRIMARY KEY (storage_code);
 A   ALTER TABLE ONLY warehouse.storage DROP CONSTRAINT storage_pkey;
    	   warehouse            postgres    false    217            �           2606    16744 &   supplier_company supplier_company_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY warehouse.supplier_company
    ADD CONSTRAINT supplier_company_pkey PRIMARY KEY (supplier_code);
 S   ALTER TABLE ONLY warehouse.supplier_company DROP CONSTRAINT supplier_company_pkey;
    	   warehouse            postgres    false    218            �           2606    16746    buyer_company unique_buyer 
   CONSTRAINT     e   ALTER TABLE ONLY warehouse.buyer_company
    ADD CONSTRAINT unique_buyer UNIQUE (organization_code);
 G   ALTER TABLE ONLY warehouse.buyer_company DROP CONSTRAINT unique_buyer;
    	   warehouse            postgres    false    210            �           2606    16748    item unique_item 
   CONSTRAINT     S   ALTER TABLE ONLY warehouse.item
    ADD CONSTRAINT unique_item UNIQUE (item_code);
 =   ALTER TABLE ONLY warehouse.item DROP CONSTRAINT unique_item;
    	   warehouse            postgres    false    211            �           2606    16750    manager unique_manager 
   CONSTRAINT     ]   ALTER TABLE ONLY warehouse.manager
    ADD CONSTRAINT unique_manager UNIQUE (employee_code);
 C   ALTER TABLE ONLY warehouse.manager DROP CONSTRAINT unique_manager;
    	   warehouse            postgres    false    212            �           2606    16752    shipping unique_shipping 
   CONSTRAINT     _   ALTER TABLE ONLY warehouse.shipping
    ADD CONSTRAINT unique_shipping UNIQUE (shipping_code);
 E   ALTER TABLE ONLY warehouse.shipping DROP CONSTRAINT unique_shipping;
    	   warehouse            postgres    false    216            �           2606    16754    storage unique_storage 
   CONSTRAINT     \   ALTER TABLE ONLY warehouse.storage
    ADD CONSTRAINT unique_storage UNIQUE (storage_code);
 C   ALTER TABLE ONLY warehouse.storage DROP CONSTRAINT unique_storage;
    	   warehouse            postgres    false    217            �           2606    16756     supplier_company unique_supplier 
   CONSTRAINT     g   ALTER TABLE ONLY warehouse.supplier_company
    ADD CONSTRAINT unique_supplier UNIQUE (supplier_code);
 M   ALTER TABLE ONLY warehouse.supplier_company DROP CONSTRAINT unique_supplier;
    	   warehouse            postgres    false    218            �           2606    16757    sale fk_buyer    FK CONSTRAINT     �   ALTER TABLE ONLY warehouse.sale
    ADD CONSTRAINT fk_buyer FOREIGN KEY (organization_code) REFERENCES warehouse.buyer_company(organization_code) NOT VALID;
 :   ALTER TABLE ONLY warehouse.sale DROP CONSTRAINT fk_buyer;
    	   warehouse          postgres    false    3202    210    214            �           2606    16762    purchase_item fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY warehouse.purchase_item
    ADD CONSTRAINT fk_item FOREIGN KEY (item) REFERENCES warehouse.item(item_code) NOT VALID;
 B   ALTER TABLE ONLY warehouse.purchase_item DROP CONSTRAINT fk_item;
    	   warehouse          postgres    false    213    211    3206            �           2606    16823    storage fk_item    FK CONSTRAINT     �   ALTER TABLE ONLY warehouse.storage
    ADD CONSTRAINT fk_item FOREIGN KEY (item_code) REFERENCES warehouse.item(item_code) NOT VALID;
 <   ALTER TABLE ONLY warehouse.storage DROP CONSTRAINT fk_item;
    	   warehouse          postgres    false    3206    211    217            �           2606    16767    shipping fk_manager    FK CONSTRAINT     �   ALTER TABLE ONLY warehouse.shipping
    ADD CONSTRAINT fk_manager FOREIGN KEY (employee_code) REFERENCES warehouse.manager(employee_code) NOT VALID;
 @   ALTER TABLE ONLY warehouse.shipping DROP CONSTRAINT fk_manager;
    	   warehouse          postgres    false    3210    216    212            �           2606    16772    sale fk_manager    FK CONSTRAINT     �   ALTER TABLE ONLY warehouse.sale
    ADD CONSTRAINT fk_manager FOREIGN KEY (employee_code) REFERENCES warehouse.manager(employee_code) NOT VALID;
 <   ALTER TABLE ONLY warehouse.sale DROP CONSTRAINT fk_manager;
    	   warehouse          postgres    false    212    214    3210            �           2606    16832    storage fk_purchase    FK CONSTRAINT     �   ALTER TABLE ONLY warehouse.storage
    ADD CONSTRAINT fk_purchase FOREIGN KEY (purchase_item) REFERENCES warehouse.purchase_item(purchase_item) NOT VALID;
 @   ALTER TABLE ONLY warehouse.storage DROP CONSTRAINT fk_purchase;
    	   warehouse          postgres    false    217    213    3214            �           2606    16777    sales_item fk_sale    FK CONSTRAINT     �   ALTER TABLE ONLY warehouse.sales_item
    ADD CONSTRAINT fk_sale FOREIGN KEY (sales_code) REFERENCES warehouse.sale(lot_number) NOT VALID;
 ?   ALTER TABLE ONLY warehouse.sales_item DROP CONSTRAINT fk_sale;
    	   warehouse          postgres    false    214    3216    215            �           2606    16839    storage fk_sales    FK CONSTRAINT     �   ALTER TABLE ONLY warehouse.storage
    ADD CONSTRAINT fk_sales FOREIGN KEY (delivered_item) REFERENCES warehouse.sales_item(delivered_item) NOT VALID;
 =   ALTER TABLE ONLY warehouse.storage DROP CONSTRAINT fk_sales;
    	   warehouse          postgres    false    215    3218    217            �           2606    16782    purchase_item fk_shipping    FK CONSTRAINT     �   ALTER TABLE ONLY warehouse.purchase_item
    ADD CONSTRAINT fk_shipping FOREIGN KEY (shipping_code) REFERENCES warehouse.shipping(shipping_code) NOT VALID;
 F   ALTER TABLE ONLY warehouse.purchase_item DROP CONSTRAINT fk_shipping;
    	   warehouse          postgres    false    3220    213    216            �           2606    16787    shipping fk_supplier    FK CONSTRAINT     �   ALTER TABLE ONLY warehouse.shipping
    ADD CONSTRAINT fk_supplier FOREIGN KEY (supplier_code) REFERENCES warehouse.supplier_company(supplier_code) NOT VALID;
 A   ALTER TABLE ONLY warehouse.shipping DROP CONSTRAINT fk_supplier;
    	   warehouse          postgres    false    216    218    3228            4   �   x�=�;�0��{ ��c����!ED��Y`!&�NOh�^33z���VE��о0��ct(�EקEC�B�����?]�<Bi$(kʵ���2�&OJ3�O8^�=/z���O�zV�U�J�k[j[��g��)��HC�xw��6��nш1��^�$h%A[�RJ��B�/�A�      5     x�MP�n�0���Ԇ#;	<h��2v�%:V�:��+����4��8��%	��{h"�=?����]�E[�{�OeA��f�++A/`P����
/�ӛJ�� �TI9n�E�������O|<q6;���
w���,R|&�������T�f��DA�"`�U�3���0M[ɬ�N!V(�����u�1O�$i%0Q�X0�&E`���/E8+�ֹQz�a��yd���_��J	M��+����pfg0���Z����f]��5M��G�t      6   ^   x��1
�0뷇��ݧ�=��[[��)DP	zSM33�9h0by�V�Z��@sM1du�Nu8��_νty�Ir�(�$B����6�@zߦ��'"�u      7   G   x����0��QLD�����:��H�դ5î�J�A���4�j���W��p�F6y.��nͺ��{"�ѝx      8   W   x�5��A��6N�^�ٕr�<F�Xl-m٫2T�0&ه�~"�j�����uw��z|*Q4NQ��lq�^�OzA����?[w�      9   <   x����0�f��$����Qg!A��~*Q��N��j�О<y�ݣt������)      :   L   x�˱�P�:�%ȱ����4�<�z	��}��C�A��.v�!v��aњ߻����w|�C�q���'�+3_���      ;   �   x�M�Mj�0����Z� {FR����R��d�ҍ�qk@?߾J(��景moi8�g'Łc�f_�����4
�R�RmC`-eAu� �Ej+���y:��]�F?�(�����9
��<��S?��g)^7q���G�������͉���@�� ���HX�=h�a���O[��|����?2O��3�)')�~^��T>��@{;Ufa�S`u�ف�J�����_�{U�      <   �   x�Mα
�0��9y�{�T������h'q)5H�핤U|{�8}����+$FUm��y��}L�Nsα1p����@�)?�w�8��V�	��Z/���uq
��GIS�N�'y2[\$�x4@�Β&�����pL��!�B���_����&`�ܭ���u��� ��7�     