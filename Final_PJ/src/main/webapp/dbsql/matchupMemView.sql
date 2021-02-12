

--2/9매치업멤전체보여주는뷰 에듀랑 커리어 중복되는것 사용 시 뺀다.
create or replace view matchupMemDetailsView
as(
    select
    m.mcumem_No,m.mem_No, m.jobsearch_Flag,m.resumeopen_Flag, m.ref_Name,
    m.resume_No,r.resume_Length,r.resume_Title,r.lang_Flag, r.resume_Introduce, 
    e.edu_No, e.edu_Name, e.edu_Major,
    c.career_No, c.career_Name, c.career_Dep,
    ex.EXPERTISE_NO,ex.jikgun_Code,(select jikgun_Name from jikgun j where j.jikgun_code=ex.jikgun_code) jikgun_Name, ex.career, ex.salary, ex.skill
    from matchupmem m left outer join resume r
    on m.resume_No=r.resume_No
    left outer join education e on e.resume_No=m.resume_No
    left outer join career c on c.resume_No=m.resume_No
    left outer join expertise ex on ex.expertise_No=m.expertise_No
);
--사용예제
select* from
(
select * from matchupMemDetailsView order by mcumem_no desc, edu_No desc, career desc
)
where mcumem_no=36 and rownum=1;


--직무코드에,직무이름 넣은 뷰
create or replace view mjikmuView
as
(
select m.mcumem_jikmu_no, m.jikmu_Code, j.jikmu_Name, jikgun_code, expertise_No from matchupMemjikmu m
join jikmu j
on m.jikmu_Code=j.jikmu_Code
);

--사용예제
select * from mjikmuView
where expertise_NO=55;

--제외기업에 제외기업코드, 기업명 보여주는 뷰 
create or replace view excomView
as
(
select me.mcumem_No, me.mcucom_No,m.com_code,m.com_Name, m.industry from matchupexcom me
join mcucomView m
on me.MCUCOM_NO = m.MCUCOM_NO
);

--사용예제
select * from excomView
where mcumem_No=46;


--제외기업을 선택하라고 보여줄 때(매치업기업보여주는 뷰)
create or replace view mcucomView 
as(
select m.mcucom_No,m.com_code,c.com_Name, c.industry from matchupCom m
join cominfo c
on c.com_Code=m.com_code
);
--사용예제
select * from mcucomview;
