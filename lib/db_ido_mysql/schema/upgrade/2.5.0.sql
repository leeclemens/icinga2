<<<<<<< HEAD
-- -----------------------------------------
-- upgrade path for Icinga 2.5.0
--
-- -----------------------------------------
-- Copyright (c) 2016 Icinga Development Team (http://www.icinga.org)
--
-- Please check http://docs.icinga.org for upgrading information!
-- -----------------------------------------

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- -----------------------------------------
-- #10069 IDO: check_source should not be a TEXT field
-- -----------------------------------------

ALTER TABLE icinga_hoststatus MODIFY COLUMN check_source varchar(255) character set latin1  default '';
ALTER TABLE icinga_servicestatus MODIFY COLUMN check_source varchar(255) character set latin1  default '';

-- -----------------------------------------
-- #10070
-- -----------------------------------------

CREATE INDEX idx_comments_object_id on icinga_comments(object_id);
CREATE INDEX idx_scheduleddowntime_object_id on icinga_scheduleddowntime(object_id);

-- -----------------------------------------
-- #11962
-- -----------------------------------------

ALTER TABLE icinga_hoststatus MODIFY COLUMN current_notification_number int unsigned default 0;
ALTER TABLE icinga_servicestatus MODIFY COLUMN current_notification_number int unsigned default 0;

-- -----------------------------------------
-- #10061
-- -----------------------------------------

ALTER TABLE icinga_contactgroups MODIFY COLUMN alias varchar(255) character set latin1  default '';
ALTER TABLE icinga_contacts MODIFY COLUMN alias varchar(255) character set latin1  default '';
ALTER TABLE icinga_hostgroups MODIFY COLUMN alias varchar(255) character set latin1  default '';
ALTER TABLE icinga_hosts MODIFY COLUMN alias varchar(255) character set latin1  default '';
ALTER TABLE icinga_servicegroups MODIFY COLUMN alias varchar(255) character set latin1  default '';
ALTER TABLE icinga_timeperiods MODIFY COLUMN alias varchar(255) character set latin1  default '';

-- -----------------------------------------
-- #10066
-- -----------------------------------------

CREATE INDEX idx_endpoints_object_id on icinga_endpoints(endpoint_object_id);
CREATE INDEX idx_endpointstatus_object_id on icinga_endpointstatus(endpoint_object_id);

CREATE INDEX idx_endpoints_zone_object_id on icinga_endpoints(zone_object_id);
CREATE INDEX idx_endpointstatus_zone_object_id on icinga_endpointstatus(zone_object_id);

CREATE INDEX idx_zones_object_id on icinga_zones(zone_object_id);
CREATE INDEX idx_zonestatus_object_id on icinga_zonestatus(zone_object_id);

CREATE INDEX idx_zones_parent_object_id on icinga_zones(parent_zone_object_id);
CREATE INDEX idx_zonestatus_parent_object_id on icinga_zonestatus(parent_zone_object_id);

-- -----------------------------------------
-- #12107
-- -----------------------------------------
CREATE INDEX idx_statehistory_cleanup on icinga_statehistory(instance_id, state_time);

-- -----------------------------------------
-- #12258
-- -----------------------------------------
ALTER TABLE icinga_comments ADD COLUMN session_token INTEGER default NULL;
ALTER TABLE icinga_scheduleddowntime ADD COLUMN session_token INTEGER default NULL;

CREATE INDEX idx_comments_session_del ON icinga_comments (instance_id, session_token);
CREATE INDEX idx_downtimes_session_del ON icinga_scheduleddowntime (instance_id, session_token);

-- -----------------------------------------
-- #12435
-- -----------------------------------------
ALTER TABLE icinga_commands ADD config_hash VARCHAR(64) DEFAULT NULL;
ALTER TABLE icinga_contactgroups ADD config_hash VARCHAR(64) DEFAULT NULL;
ALTER TABLE icinga_contacts ADD config_hash VARCHAR(64) DEFAULT NULL;
ALTER TABLE icinga_hostgroups ADD config_hash VARCHAR(64) DEFAULT NULL;
ALTER TABLE icinga_hosts ADD config_hash VARCHAR(64) DEFAULT NULL;
ALTER TABLE icinga_servicegroups ADD config_hash VARCHAR(64) DEFAULT NULL;
ALTER TABLE icinga_services ADD config_hash VARCHAR(64) DEFAULT NULL;
ALTER TABLE icinga_timeperiods ADD config_hash VARCHAR(64) DEFAULT NULL;
ALTER TABLE icinga_endpoints ADD config_hash VARCHAR(64) DEFAULT NULL;
ALTER TABLE icinga_zones ADD config_hash VARCHAR(64) DEFAULT NULL;

ALTER TABLE icinga_customvariables DROP session_token;
ALTER TABLE icinga_customvariablestatus DROP session_token;

CREATE INDEX idx_customvariables_object_id on icinga_customvariables(object_id);
CREATE INDEX idx_contactgroup_members_object_id on icinga_contactgroup_members(contact_object_id);
CREATE INDEX idx_hostgroup_members_object_id on icinga_hostgroup_members(host_object_id);
CREATE INDEX idx_servicegroup_members_object_id on icinga_servicegroup_members(service_object_id);
CREATE INDEX idx_servicedependencies_dependent_service_object_id on icinga_servicedependencies(dependent_service_object_id);
CREATE INDEX idx_hostdependencies_dependent_host_object_id on icinga_hostdependencies(dependent_host_object_id);
CREATE INDEX idx_service_contacts_service_id on icinga_service_contacts(service_id);
CREATE INDEX idx_host_contacts_host_id on icinga_host_contacts(host_id);

-- -----------------------------------------
-- set dbversion
-- -----------------------------------------
INSERT INTO icinga_dbversion (name, version, create_time, modify_time) VALUES ('idoutils', '1.14.1', NOW(), NOW()) ON DUPLICATE KEY UPDATE version='1.14.1', modify_time=NOW();
=======
ALTER TABLE ...blah DEFAULT NULL;??

UPDATE  icinga_acknowledgements           SET  end_time                  = NULL WHERE end_time                  = '0000-00-00 00:00:00';
UPDATE  icinga_acknowledgements           SET  entry_time                = NULL WHERE entry_time                = '0000-00-00 00:00:00';
UPDATE  icinga_commenthistory             SET  comment_time              = NULL WHERE comment_time              = '0000-00-00 00:00:00';
UPDATE  icinga_commenthistory             SET  deletion_time             = NULL WHERE deletion_time             = '0000-00-00 00:00:00';
UPDATE  icinga_commenthistory              SET  entry_time                = NULL WHERE entry_time                = '0000-00-00 00:00:00';
UPDATE  icinga_commenthistory              SET  expiration_time           = NULL WHERE expiration_time           = '0000-00-00 00:00:00';
UPDATE  icinga_comments                    SET  comment_time              = NULL WHERE comment_time              = '0000-00-00 00:00:00';
UPDATE  icinga_comments                    SET  entry_time                = NULL WHERE entry_time                = '0000-00-00 00:00:00';
UPDATE  icinga_comments                    SET  expiration_time           = NULL WHERE expiration_time           = '0000-00-00 00:00:00';
UPDATE  icinga_conninfo                    SET  connect_time              = NULL WHERE connect_time              = '0000-00-00 00:00:00';
UPDATE  icinga_conninfo                    SET  data_end_time             = NULL WHERE data_end_time             = '0000-00-00 00:00:00';
UPDATE  icinga_conninfo                    SET  data_start_time           = NULL WHERE data_start_time           = '0000-00-00 00:00:00';
UPDATE  icinga_conninfo                    SET  disconnect_time           = NULL WHERE disconnect_time           = '0000-00-00 00:00:00';
UPDATE  icinga_conninfo                    SET  last_checkin_time         = NULL WHERE last_checkin_time         = '0000-00-00 00:00:00';
UPDATE  icinga_contactnotificationmethods  SET  end_time                  = NULL WHERE end_time                  = '0000-00-00 00:00:00';
UPDATE  icinga_contactnotificationmethods  SET  start_time                = NULL WHERE start_time                = '0000-00-00 00:00:00';
UPDATE  icinga_contactnotifications        SET  end_time                  = NULL WHERE end_time                  = '0000-00-00 00:00:00';
UPDATE  icinga_contactnotifications        SET  start_time                = NULL WHERE start_time                = '0000-00-00 00:00:00';
UPDATE  icinga_contactstatus               SET  last_host_notification    = NULL WHERE last_host_notification    = '0000-00-00 00:00:00';
UPDATE  icinga_contactstatus               SET  last_service_notification = NULL WHERE last_service_notification = '0000-00-00 00:00:00';
UPDATE  icinga_contactstatus               SET  status_update_time        = NULL WHERE status_update_time        = '0000-00-00 00:00:00';
UPDATE  icinga_customvariablestatus        SET  status_update_time        = NULL WHERE status_update_time        = '0000-00-00 00:00:00';
UPDATE  icinga_dbversion                   SET  create_time               = NULL WHERE create_time               = '0000-00-00 00:00:00';
UPDATE  icinga_dbversion                   SET  modify_time               = NULL WHERE modify_time               = '0000-00-00 00:00:00';
UPDATE  icinga_downtimehistory             SET  actual_end_time           = NULL WHERE actual_end_time           = '0000-00-00 00:00:00';
UPDATE  icinga_downtimehistory             SET  actual_start_time         = NULL WHERE actual_start_time         = '0000-00-00 00:00:00';
UPDATE  icinga_downtimehistory             SET  entry_time                = NULL WHERE entry_time                = '0000-00-00 00:00:00';
UPDATE  icinga_downtimehistory             SET  scheduled_end_time        = NULL WHERE scheduled_end_time        = '0000-00-00 00:00:00';
UPDATE  icinga_downtimehistory             SET  scheduled_start_time      = NULL WHERE scheduled_start_time      = '0000-00-00 00:00:00';
UPDATE  icinga_downtimehistory             SET  trigger_time              = NULL WHERE trigger_time              = '0000-00-00 00:00:00';
UPDATE  icinga_endpointstatus              SET  status_update_time        = NULL WHERE status_update_time        = '0000-00-00 00:00:00';
UPDATE  icinga_eventhandlers               SET  end_time                  = NULL WHERE end_time                  = '0000-00-00 00:00:00';
UPDATE  icinga_eventhandlers               SET  start_time                = NULL WHERE start_time                = '0000-00-00 00:00:00';
UPDATE  icinga_externalcommands            SET  entry_time                = NULL WHERE entry_time                = '0000-00-00 00:00:00';
UPDATE  icinga_flappinghistory             SET  comment_time              = NULL WHERE comment_time              = '0000-00-00 00:00:00';
UPDATE  icinga_flappinghistory             SET  event_time                = NULL WHERE event_time                = '0000-00-00 00:00:00';
UPDATE  icinga_hostchecks                  SET  end_time                  = NULL WHERE end_time                  = '0000-00-00 00:00:00';
UPDATE  icinga_hostchecks                  SET  start_time                = NULL WHERE start_time                = '0000-00-00 00:00:00';
UPDATE  icinga_hoststatus                  SET  last_check                = NULL WHERE last_check                = '0000-00-00 00:00:00';
UPDATE  icinga_hoststatus                  SET  last_hard_state_change    = NULL WHERE last_hard_state_change    = '0000-00-00 00:00:00';
UPDATE  icinga_hoststatus                  SET  last_notification         = NULL WHERE last_notification         = '0000-00-00 00:00:00';
UPDATE  icinga_hoststatus                  SET  last_state_change         = NULL WHERE last_state_change         = '0000-00-00 00:00:00';
UPDATE  icinga_hoststatus                  SET  last_time_down            = NULL WHERE last_time_down            = '0000-00-00 00:00:00';
UPDATE  icinga_hoststatus                  SET  last_time_unreachable     = NULL WHERE last_time_unreachable     = '0000-00-00 00:00:00';
UPDATE  icinga_hoststatus                  SET  last_time_up              = NULL WHERE last_time_up              = '0000-00-00 00:00:00';
UPDATE  icinga_hoststatus                  SET  next_check                = NULL WHERE next_check                = '0000-00-00 00:00:00';
UPDATE  icinga_hoststatus                  SET  next_notification         = NULL WHERE next_notification         = '0000-00-00 00:00:00';
UPDATE  icinga_hoststatus                  SET  status_update_time        = NULL WHERE status_update_time        = '0000-00-00 00:00:00';
UPDATE  icinga_logentries                  SET  entry_time                = NULL WHERE entry_time                = '0000-00-00 00:00:00';
UPDATE  icinga_logentries                  SET  logentry_time             = NULL WHERE logentry_time             = '0000-00-00 00:00:00';
UPDATE  icinga_notifications               SET  end_time                  = NULL WHERE end_time                  = '0000-00-00 00:00:00';
UPDATE  icinga_notifications               SET  start_time                = NULL WHERE start_time                = '0000-00-00 00:00:00';
UPDATE  icinga_processevents               SET  event_time                = NULL WHERE event_time                = '0000-00-00 00:00:00';
UPDATE  icinga_programstatus               SET  disable_notif_expire_time = NULL WHERE disable_notif_expire_time = '0000-00-00 00:00:00';
UPDATE  icinga_programstatus               SET  last_command_check        = NULL WHERE last_command_check        = '0000-00-00 00:00:00';
UPDATE  icinga_programstatus               SET  last_log_rotation         = NULL WHERE last_log_rotation         = '0000-00-00 00:00:00';
UPDATE  icinga_programstatus               SET  program_end_time          = NULL WHERE program_end_time          = '0000-00-00 00:00:00';
UPDATE  icinga_programstatus               SET  program_start_time        = NULL WHERE program_start_time        = '0000-00-00 00:00:00';
UPDATE  icinga_programstatus               SET  status_update_time        = NULL WHERE status_update_time        = '0000-00-00 00:00:00';
UPDATE  icinga_scheduleddowntime           SET  actual_start_time         = NULL WHERE actual_start_time         = '0000-00-00 00:00:00';
UPDATE  icinga_scheduleddowntime           SET  entry_time                = NULL WHERE entry_time                = '0000-00-00 00:00:00';
UPDATE  icinga_scheduleddowntime           SET  scheduled_end_time        = NULL WHERE scheduled_end_time        = '0000-00-00 00:00:00';
UPDATE  icinga_scheduleddowntime           SET  scheduled_start_time      = NULL WHERE scheduled_start_time      = '0000-00-00 00:00:00';
UPDATE  icinga_scheduleddowntime           SET  trigger_time              = NULL WHERE trigger_time              = '0000-00-00 00:00:00';
UPDATE  icinga_servicechecks               SET  end_time                  = NULL WHERE end_time                  = '0000-00-00 00:00:00';
UPDATE  icinga_servicechecks               SET  start_time                = NULL WHERE start_time                = '0000-00-00 00:00:00';
UPDATE  icinga_servicestatus               SET  last_check                = NULL WHERE last_check                = '0000-00-00 00:00:00';
UPDATE  icinga_servicestatus               SET  last_hard_state_change    = NULL WHERE last_hard_state_change    = '0000-00-00 00:00:00';
UPDATE  icinga_servicestatus               SET  last_notification         = NULL WHERE last_notification         = '0000-00-00 00:00:00';
UPDATE  icinga_servicestatus               SET  last_state_change         = NULL WHERE last_state_change         = '0000-00-00 00:00:00';
UPDATE  icinga_servicestatus               SET  last_time_critical        = NULL WHERE last_time_critical        = '0000-00-00 00:00:00';
UPDATE  icinga_servicestatus               SET  last_time_ok              = NULL WHERE last_time_ok              = '0000-00-00 00:00:00';
UPDATE  icinga_servicestatus               SET  last_time_unknown         = NULL WHERE last_time_unknown         = '0000-00-00 00:00:00';
UPDATE  icinga_servicestatus               SET  last_time_warning         = NULL WHERE last_time_warning         = '0000-00-00 00:00:00';
UPDATE  icinga_servicestatus               SET  next_check                = NULL WHERE next_check                = '0000-00-00 00:00:00';
UPDATE  icinga_servicestatus               SET  next_notification         = NULL WHERE next_notification         = '0000-00-00 00:00:00';
UPDATE  icinga_servicestatus               SET  status_update_time        = NULL WHERE status_update_time        = '0000-00-00 00:00:00';
UPDATE  icinga_statehistory                SET  state_time                = NULL WHERE state_time                = '0000-00-00 00:00:00';
UPDATE  icinga_systemcommands              SET  end_time                  = NULL WHERE end_time                  = '0000-00-00 00:00:00';
UPDATE  icinga_systemcommands              SET  start_time                = NULL WHERE start_time                = '0000-00-00 00:00:00';
UPDATE  icinga_zonestatus                  SET  status_update_time        = NULL WHERE status_update_time        = '0000-00-00 00:00:00';
>>>>>>> Convert 0000-00-00 00:00:00 to NULL
