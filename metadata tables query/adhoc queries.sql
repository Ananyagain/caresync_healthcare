--SELECT * FROM [ctrl].[table_config]
SELECT * FROM [ctrl].[audit_log] where adf_run_id = '4f6b5677-6590-405f-9835-19ce0b52af21'
SELECT count(*) FROM [ctrl].[audit_log] where adf_run_id = '4f6b5677-6590-405f-9835-19ce0b52af21' 
and [status] != 'SUCCESS'
--where adf_run_id='a7'
ORDER by created_timestamp desc

update [ctrl].[table_config]
set is_active=1
where table_id=4
DELETE from ctrl.audit_log where adf_run_id in('a3', 'a4', 'a5', 'a6', 'a7')

insert into ctrl.audit_log(
adf_run_id, 
table_id,
stage,
[status],
start_time)
values(
'a2', 1, 'source_to_silver','in_progress', SYSUTCDATETIME())

update ctrl.
set [status] = 'success',
end_time=SYSUTCDATETIME(),
records_written = 50
where adf_run_id='a2' and table_id=1

update ctrl.table_config set is_active=1 where table_id=3

select * from ctrl.watermark where table_id=3

update ctrl.watermark
set watermark_value = '1900-01-01T00:00:00'
WHERE table_id = 3
