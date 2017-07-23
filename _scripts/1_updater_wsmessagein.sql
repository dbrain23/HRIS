
		  
	  alter table wsmessagein
	  add last_transaction_date datetime not null default getdate()
	  
	  alter table wsmessagein
	  add sync_attempts int not null default 0