.mode column

create table calendar_event (
       id integer primary key,
       title varchar(255),
       start_date varchar(255)
);

create table appointment_data (
       event integer,
       appt_type varchar(255),
       appt_cost integer,

       unique(event)
);

create table availability_data (
       event integer,
       color varchar(255),
       allow_rule varchar(255),

       unique(event)
);

.mode column

insert into calendar_event(id, title, start_date)
            values(1, 'team meeting', '2023-01-01');
insert into calendar_event(id, title, start_date)
            values(2, 'Online Scheduling', '2023-01-01');
insert into calendar_event(id, title, start_date)
            values(3, '1on1', '2023-01-01');
insert into calendar_event(id, title, start_date)
            values(4, '1on1', '2023-01-12');

insert into appointment_data(event, appt_type, appt_cost)
            values(1, 'group meeting', 100);
insert into appointment_data(event, appt_type, appt_cost)
            values(3, '2 person meeting', 1000);
insert into appointment_data(event, appt_type, appt_cost)
            values(4, '2 person meeting', 1000);
insert into availability_data(event, color, allow_rule)
            values(2, 'blue', '*');

.print ''

select calendar_event.*,

       appointment_data.appt_type as ad_appt_type,
       appointment_data.appt_cost as ad_appt_cost,

       availability_data.color as av_color,
       availability_data.allow_rule as av_allow_rule
       
       from calendar_event

       left join appointment_data
            on calendar_event.id = appointment_data.event

       left join availability_data
            on calendar_event.id = availability_data.event

       where calendar_event.start_date = '2023-01-01';
            
.print ''

.exit

