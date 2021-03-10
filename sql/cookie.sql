CREATE TABLE member (
	member_id varchar2(20),                     -- 회원 아이디(pk)
	member_pw varchar2(300) NOT NULL,           -- 회원 비밀번호
	member_name varchar2(20) NOT NULL,          -- 회원 이름
	Society_front_number number NOT NULL,       -- 주민번호 앞자리
	Society_back_number	number NOT NULL,        -- 주민번호 뒷자리
	email varchar2(30) NULL,                    -- 이메일
	email_get char(1) default 'N',              -- 이메일 수신여부
	mobile_number varchar2(13) NOT NULL,        -- 핸드폰 번호
	phone_number varchar2(13) NULL,             -- 집 전화번호
	zip_code varchar2(13) NULL,                 -- 우편번호
	member_addr varchar2(70) NULL,              -- 기본 주소
	member_addr_detail varchar2(70) NULL,       -- 상세 주소
	is_admin char(1) default 'N',               -- 관리자 여부
	enroll_date date default sysdate,           -- 회원가입일
    member_delete char(1) default 'N',          -- 삭제 여부
    constraint pk_member_id primary key(member_id),
    constraint ck_member_is_admin check(is_admin in ('Y', 'N')),
    constraint ck_member_member_delete check(member_delete in ('Y', 'N')),
    constraint ck_member_email_get check(email_get in ('Y', 'N'))
);

CREATE TABLE order_table (
	order_num number,                           -- 인덱스 번호(pk)
	order_trade_num	varchar2(50) NOT NULL,      -- 주문 번호(unique) 20210226 + 난수 이런느낌으로 제작
	order_trans_num	varchar2(50) NULL,          -- 운송장 번호
	order_receive_name varchar2(20) NULL,       -- 받는사람 이름
	order_receive_addr varchar2(70) NULL,       -- 기본 주소
	order_receive_addr_detail varchar2(70) NULL,    -- 상세 주소
	order_receive_phone varchar2(13) NULL,      -- 집 전화번호
	order_receive_mobile varchar2(13) NULL,     -- 핸드폰 전화번호
	order_memo varchar2(3000) NULL,             -- 요구사항
	order_sum_money number NULL,                -- 합계 금액
	order_trade_type varchar2(20) NULL,         -- 결제 방법
	order_date date default sysdate,            -- 주문 날짜
	order_status number NULL,                   -- 결제상태 (0:대기중 1:발송준비 2:발송완료 3:배송중 4:배송완료 5:주문취소)
    order_delete char(1) NULL,                  -- 삭제 여부
    member_id varchar2(20) NULL,                -- 멤버 아이디(fk) member.member_id 참조
    card_num number,                            -- 카드 승인번호
    zip_code varchar2(13) NULL,                 -- 우편 번호
    order_email varchar2(30),                   -- 이메일
    constraint pk_order_table_order_num primary key(order_num),
    constraint uq_order_table_order_trade_num unique(order_trade_num),
    constraint ck_order_table_order_delete check(order_delete in ('Y', 'N')),
      constraint fk_order_table_member_id foreign key(member_id)
                             references member(member_id)
                                    on delete cascade
);



insert into basket values(seq_basket_no.nextval, 1, 2600, 'aaaa', 4, 'N', default);
insert into basket values(seq_basket_no.nextval, 1, 3200, 'aaaa', 5, 'N', default);
insert into basket values(seq_basket_no.nextval, 1, 2600, 'qwerty', 4, 'N', default);
insert into basket values(seq_basket_no.nextval, 1, 3200, 'qwerty', 5, 'N', default);
commit;



CREATE TABLE dessert (
	dessert_num	number,                         -- 상품 고유번호 (pk)
	dessert_category varchar2(20) NOT NULL,     -- 제품군
	dessert_name varchar2(50) NOT NULL,         -- 제품 이름
	dessert_content varchar2(3000) NULL,        -- 제품 소개글
    dessert_amount number NOT NULL,             -- 현재 제품 수량
	dessert_price number NOT NULL,              -- 제품 가격
	dessert_original_image varchar2(200) NULL,   -- 원래 이미지파일 이름
	dessert_rename_image varchar2(200) NULL,        -- 변경된 이미지파일 이름
    dessert_is_best char(1) default 'N' NOT NULL,  -- 인기상품 여부
	dessert_enroll_date date default sysdate,   -- 제품 등록 날짜
    dessert_delete char(1) default 'N',         -- 제품 삭제 여부
    constraint pk_dessesrt_dessert_num primary key(dessert_num),
    constraint ck_dessert_dessert_is_best check(dessert_is_best in ('Y', 'N')),
    constraint ck_dessert_dessert_delete check(dessert_delete in ('Y', 'N'))
);



CREATE TABLE basket (
	basket_num number,                              -- 장바구니 고유 번호(pk)
	basket_amount number NULL,                      -- 상품 수량
    basket_sum_money number NULL,                   -- 합계 금액
	member_id varchar2(20),                         -- 회원 아이디
	dessert_num number NOT NULL,                    -- 상품 번호(fk) dessert.dessert_num 참조
    basket_delete char(1) default 'N' NULL,         -- 삭제 여부
    basket_date date default sysdate,               -- 추가 날짜
    constraint pk_basket_basket_num primary key(basket_num),
    constraint fk_basket_member_id foreign key(member_id)
                                    references member(member_id)
                                    on delete cascade,
    constraint fk_basket_dessert_num foreign key (dessert_num)
                                references dessert(dessert_num)
                                on delete cascade,
    constraint ck_basket_basket_delete check(basket_delete in ('Y', 'N'))
);  



CREATE TABLE qna (
	qna_num number,                               -- 문의사항 번호(pk)
	qna_title varchar2(50) NOT NULL,              -- 문의사항 제목
	qna_content varchar2(2000) NOT NULL,          -- 문의사항 내용
    qna_writer varchar2(20) NOT NULL,             -- 작성자(멤버아이디) (fK) member.member_id 참조
	qna_re_ref number NULL,                       -- 답글을 달 문의사항 글 번호 qna.qna_num
	qna_re_lev number NULL,                       -- 답변 글 깊이 (1:글 2:답글)
	qna_date date default sysdate,                -- 문의사항 등록 날짜
    qna_delete char(1) default 'N',               -- 글 삭제 여부
    constraint pk_qna_qna_num primary key(qna_num),
    constraint fk_qna_qna_writer foreign key(qna_writer)
                                    references member(member_id)
                                    on delete cascade,
    constraint ck_qna_qna_delete check(qna_delete in ('Y', 'N'))
);



CREATE TABLE notice (
	notice_num number,                                  -- 공지사항 번호(pk)
    notice_title varchar2(50) NOT NULL,                 -- 공지사항 제목
	notice_writer varchar2(20) NOT NULL,                -- 공지사항 작성자 (fk) member.member_id 참조
    notice_content varchar2(2000) NOT NULL,             -- 공지사항 내용
	notice_original_image varchar2(50) NULL,            -- 원래 파일 이름 
    notice_rename_image varchar2(50) NULL,              -- 변경된 파일 이름
	notice_date date default sysdate,                   -- 공지글 등록 날짜
    notice_delete char(1) default 'N',                  -- 삭제 여부
	constraint pk_notice_notice_num primary key(notice_num),
    constraint fk_notice_notice_writer foreign key(notice_writer)
                                        references member(member_id)
                                        on delete cascade,
    constraint ck_notice_notice_delete check(notice_delete in ('Y', 'N'))
);



CREATE TABLE order_dessert (
	order_trade_num varchar2(50) NOT NULL,        -- 주문 번호(fk)   order_table.order_trade_num 참조
	dessert_num number NOT NULL,                  -- 상품 고유번호(fK)  dessert.dessert_num 참조
	order_dessert_amount number NOT NULL,         -- 해당 상품 주문 수량
    order_dessert_delete char(1) default 'N',     -- 삭제 여부
    constraint fk_order_trade_num foreign key (order_trade_num)
                                    references order_table(order_trade_num)
										 on delete cascade,
    constraint fk_dessert_num foreign key (dessert_num) 
                                    references dessert (dessert_num)		  
                                    on delete cascade,
    constraint ck_order_dessert_delete check(order_dessert_delete in ('Y', 'N'))
);





create sequence seq_order_table_no
start with 1
increment by 1
nominvalue
nomaxvalue
nocycle
nocache;

create sequence seq_dessert_no
start with 1
increment by 1
nominvalue
nomaxvalue
nocycle
nocache;

create sequence seq_basket_no
start with 1
increment by 1
nominvalue
nomaxvalue
nocycle
nocache;

create sequence seq_qna_no
start with 1
increment by 1
nominvalue
nomaxvalue
nocycle
nocache;

create sequence seq_notice_no
start with 1
increment by 1
nominvalue
nomaxvalue
nocycle
nocache;
