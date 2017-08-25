module IndFlow
  class Common::Add
    def run
      @build_branch ||= "#{@build_type}/#{@version}"

      success_branches = []

      @branches.each do |branch|
        queue = CommandQueue.new
        queue.add Git.fetch(remote: 'origin')
        queue.add Git.checkout(branch_name: @build_branch)
        queue.add Git.checkout(branch_name: branch)
        queue.add Git.rebase(base_branch_name: @build_branch)
        queue.add Git.checkout(branch_name: @build_branch)
        queue.add Git.merge(branch_name: branch)
        queue.add Git.push(remote: 'origin', branch_name: @build_branch)
        if queue.run
          success_branches << branch
        end
      end

      cleanup

      @failed_branches = @branches - success_branches
      if !@failed_branches.empty?
        report_failure
      end
    end

    def cleanup
      queue = CommandQueue.new(suppress_output: true)
      @branches.each { |branch| queue.add Git.delete_branch(branch_name: branch) }
      queue.run
    end

    def report_failure
      puts "These branches failed:"
      @failed_branches.each do |branch|
        puts "  #{branch}"
      end
      puts "When the above problems are resolved, you can re-run this with:"
      puts "  ind_flow #{@build_type} add -v #{@version} -b #{@failed_branches.join(' ')}"
    end
  end
end
