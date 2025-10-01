# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'sysstat class:' do
  context 'with default parameters' do
    it 'runs successfully' do
      pp = <<-PP
      class { 'sysstat': }
      PP

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe package('sysstat') do
      it { is_expected.to be_installed }
    end

    describe service('sysstat') do
      it { is_expected.to be_enabled }
    end

    describe file('/etc/sysconfig/sysstat') do
      it { is_expected.to be_file }
      it { is_expected.to be_mode 644 }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_grouped_into 'root' }
    end
  end
end
