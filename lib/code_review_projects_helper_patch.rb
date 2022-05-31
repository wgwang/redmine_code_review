# Code Review plugin for Redmine
# Copyright (C) 2009-2011  Haruyuki Iida
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require_dependency 'projects_helper'

module CodeReviewProjectsHelperPatch
  module ProjectsHelperPatch
    def project_settings_tabs
      tabs = super
      action = {:name => 'code_review', :controller => 'code_review_settings', :action => :show, :partial => 'code_review_settings/show', :label => :code_review}

      tabs << action if User.current.allowed_to?(action, @project)

      tabs
    end
  end
end

ProjectsHelper.prepend(CodeReviewProjectsHelperPatch)
