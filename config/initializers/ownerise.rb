require Rails.root.join 'lib', 'ownerise'

String.send(:include, Ownerise)
