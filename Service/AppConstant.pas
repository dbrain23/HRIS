unit AppConstant;

interface

uses
  SysUtils;

type
  TAppConstant = class

    type
      TConfig = class
        const
          IniFile = 'ascc.ini';
          ReportZoom = 380;
      end;

    type
      TCancelValue = class(TObject)
        const
          False = 0;
          True = 1;
    end;

    type
      TBooleanValue = class
        const
          TRUEVALUE = 1;
          FALSEVALUE = 0;
      end;

    type
      TErrorMsg = class
        const
          USER_NOT_FOUND = 'User not found.';
          INACTIVE_USER = 'User is inactive.';
          PASSWORD_NOT_VALID = 'Username and password mismatch.';
          ACCESS_DENIED = 'Access is denied. Please contact administrator.';
          CANCELLED_TRANSACTION = 'Transaction has already been cancelled.';
          USER_HAS_NO_PRIVILEGES = 'User has no privileges.';
        end;

    type
      TTimeStatus = class
        const
          PENDING = 'PND';
          APPROVED = 'APP';
          DENIED = 'DND';
          CANCELLED = 'CNL';
        end;

    type
      TLeaveStatus = class
        const
          PENDING = 'PND';
          APPROVED = 'APP';
          DENIED = 'DND';
          CANCELLED = 'CNL';
      end;

    type
      TRosterStatus = class
        const
          ROSTER_IN_PROGRESS = 'RIP';
          INITIAL = 'INI';
          FINALISED = 'FIN';
      end;

    type
      TRosterDetailStatus = class
        const
          ACTIVE = 'ACT';
          CANCELLED = 'CNL';
          MOVED = 'MOV';
          SWAPPED = 'SWP';
          ADDTOROSTER = 'ATR';
      end;

    type
      TRecordStatus = class
        const
          RECORD_SAVED = 'Record has been saved successfully.';
          RECORD_SYNCED = 'Record has been qued for syncing.';
          DTR_OVERRIDEN = 'Override has been recorded successfully.';
        end;

    type
      TDeductionType = class
        const
          SSS = 'SSS';
      end;

    type
      TResourceType = class
        const
          DEPARTMENT = 'DEP';
          LOCATION = 'LOC';
          POSITIONTYPE = 'POS';
      end;

    type
      TGeneral = class
        const
          TICK = 80;
          LIMIT = 6;
          INCREMENT = 16;
          LINEBREAK = {$IFDEF LINUX} AnsiChar(#10) {$ENDIF}
                       {$IFDEF MSWINDOWS} AnsiString(#13#10) {$ENDIF};
          IMAGE_PATH = 'images\';
          PASSWORDLENGTH = 6;
          DELIMITER = ';';
          MAX_UNDERTIME = 2;
        end;

    type
      TMessage = class
        const
          CANCEL_TRANSACTION = 'Are you sure you want to cancel this transaction?';
      end;

    type
      TReport = class
        const
         ATTENDANCE = 101;
      end;

    type
      TPafStatus = class
        const
          PENDING = 'PND';
          APPROVED = 'APP';
      end;

    type
      TPayrollStatus = class
        const
          INPROGRESS = 'INP';
          FINALISED = 'FIN';
      end;

    type
      TPrivilege = class
        // use "underscore" instead of a space
        // this is for parsing purposes
        // format is as follows: 'CODE;Description;Module';
        const
          EMP_VIEW          = 'EMP_VIEW;View_employee_ record;EMP';
          EMP_ADD_NEW       = 'EMP_ADD_NEW;Add_new_employee;EMP';
          EMP_MODIFY        = 'EMP_MODIFY;Modify_employee_details;EMP';
          EMP_DEPENDENT     = 'EMP_DEPENDENT;Setting_employee_dependents;EMP';
          // PAF PRIVILEGES
          PAF_ADD_NEW       = 'PAF_ADD_NEW;Add_new_PAF;PAF';
          PAF_CANCEL        = 'PAF_CANCEL;Cancel_PAF;PAF';
          PAF_VIEW          = 'PAF_VIEW;View_PAF;PAF';
          PAF_APPROVE       = 'PAF_APPROVE;Approve_PAF;PAF';
          PAF_EDIT          = 'PAF_EDIT;Edit_PAF;PAF';
          USER_ADD_NEW      = 'USER_ADD_NEW;Add_system_user;SEC';
          USER_MODIFY       = 'USER_MODIFY;Assign_user_roles;SEC';
          USER_VIEW         = 'USER_VIEW;View_systerm_users;SEC';
          ROLE_MODIFY       = 'ROLE_MODIFY;Add_or_remove_role_privileges;SEC';
          ROLE_NEW          = 'ROLE_NEW;Add_new_role;SEC';
          ROLE_VIEW         = 'ROLE_VIEW;View_system_roles;SEC';
          PRIV_VIEW         = 'PRIV_VIEW;View_system_privileges;SEC';
          PRIV_MODIFY       = 'PRIV_MODIFY;Add_or_remove_privileges;SEC';
          SYSCONFIG_VIEW    = 'SYSCONFIG_VIEW;View_system_configuration;CFG';
          SYSCONFIG_ADD     = 'SYSCONFIG_ADD;Add_new_value_in_system_configuration;CFG';
          SYSCONFIG_MODIFY  = 'SYSCONFIG_MODIFY;Modify_system_configuration_values;CFG';
          LEAVE_APPROVE     = 'LEAVE_APPROVE;Approve_leave_applications;LVE';
          LEAVE_DISAPPROVE  = 'LEAVE_DISAPPROVE;Disapprove_leave_applications;LVE';
          // CONFIG_MANAGER    = 'CONFIG_MANAGER;Configuration_manager_access;CFG';
          OVERRIDE_DTR      = 'OVERRIDE_DTR;Override_employee_time_log;DTR';
          SYNC_EMPLOYEE     = 'SYNC_EMPLOYEE;Synchronise_employee_records;EMP';
          OVERTIME_DTR      = 'OVERTIME_DTR;Add_or_modify_overtime_records;DTR';
          LEAVE_NEW         = 'LEAVE_NEW;Add_leave_records;DTR';
          LEAVE_MODIFY_ST   = 'LEAVE_MODIFY_ST;Modify_leave_status;DTR';
          LEAVE_VIEW_ALL    = 'LEAVE_VIEW_ALL;View_leaves_(ALL);DTR';
          LEAVE_VIEW        = 'LEAVE_VIEW_LOC;View_location_or_department_leaves;DTR';
          UNDERTIME_DTR     = 'UNDERTIME_DTR;Add_undertime_records;DTR';
          UNDERTIME_APPROVE = 'UNDERTIME_APPROVE;Approve_undertime_records;DTR';
          UNDERTIME_EDIT    = 'UNDERTIME_EDIT;Edit_undertime_records;DTR';
          DTR_VIEW          = 'DTR_VIEW;View_location_or_department_time_log;DTR';
          DTR_VIEW_ALL      = 'DTR_VIEW_ALL;View_time_log_(ALL);DTR';
          ROSTER_VIEW       = 'ROSTER_VIEW;View_location_or_department_skeletal;DTR';
          ROSTER_VIEW_ALL   = 'ROSTER_VIEW_ALL;View_skeletal_(ALL);DTR';
          ROSTER_MODIFY     = 'ROSTER_MODIFY;Modify_skeletal;DTR';
          HOLIDAY_VIEW      = 'HOLIDAY_VIEW;View_holiday;DTR';
          HOLIDAY_MODIFY    = 'HOLIDAY_MODIFY;Modify_holiday;DTR';
          HOLIDAY_NEW       = 'HOLIDAY_NEW;Add_holiday;DTR';
          // PAYROLL PRIVILEGES
          PAYROLL_VIEW      = 'PAYROLL_VIEW;View_payroll;PAY';
          PAYROLL_GENERATE  = 'PAYROLL_GENERATE;Generate_payroll;PAY';
          PAYROLL_CLOSE     = 'PAYROLL_CLOSE;Close_payroll;PAY';
          PAYROLL_MODIFY    = 'PAYROLL_MODIFY;Modify_payroll_record;PAY';
          PAYROLL_DEDUCTION = 'PAYROLL_DEDUCTION;Add_or_modify_payroll_deduction;PAY';
          // MISCELLANEOUS
          FILTER_BY_POS     = 'FILTER_BY_POS;Filter_time_and_attendance_by_position;DTR';

          // adjust the array size before adding an item
          // array size is equal to the number of privileges
          PRIVILEGES: array [1..46] of string = (EMP_VIEW, EMP_ADD_NEW, EMP_MODIFY,
            EMP_DEPENDENT, PAF_ADD_NEW, PAF_CANCEL, PAF_VIEW, PAF_APPROVE, PAF_EDIT,
            USER_ADD_NEW, USER_MODIFY, USER_VIEW, ROLE_MODIFY, ROLE_NEW,
            ROLE_VIEW, PRIV_VIEW, PRIV_MODIFY, SYSCONFIG_VIEW, SYSCONFIG_ADD,
            SYSCONFIG_MODIFY, LEAVE_APPROVE, LEAVE_DISAPPROVE,
            OVERRIDE_DTR, SYNC_EMPLOYEE, OVERTIME_DTR, LEAVE_NEW, LEAVE_MODIFY_ST,
            LEAVE_VIEW_ALL, LEAVE_VIEW, UNDERTIME_DTR, UNDERTIME_APPROVE, UNDERTIME_EDIT,
            DTR_VIEW, DTR_VIEW_ALL, ROSTER_VIEW, ROSTER_VIEW_ALL,ROSTER_MODIFY,
            HOLIDAY_VIEW, HOLIDAY_MODIFY, HOLIDAY_NEW, PAYROLL_VIEW,
            PAYROLL_GENERATE, PAYROLL_CLOSE, PAYROLL_MODIFY,FILTER_BY_POS,
            PAYROLL_DEDUCTION);
      end;

    TModule = (mdEmployee, mdPaf, mdSecurity, mdActivity, mdSysConfig,
        mdLeave, mdDtr);

end;

implementation

end.
