#!/bin/bash

cd
cp ~/chef-awsbase/aws.json ~/chef-awsbase/solo.rb /
cd /
chef-solo -c solo.rb -j aws.json
