require 'spec_helper_acceptance'

describe 'sysstat class:' do
  context 'default parameters' do
    it 'should run successfully' do
      pp =<<-EOS
      class { 'sysstat': }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe package('sysstat') do
      it { should be_installed }
    end

    describe service('sysstat') do
      it { should be_enabled }
    end

    describe file('/etc/sysconfig/sysstat') do
      it { should be_file }
      it { should be_mode 644 }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
    end
  end
end
