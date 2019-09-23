require "find_n_biggest_numbers_in_text/version"

module FindNBiggestNumbersInText
  class Error < StandardError; end

  MAX_LEN = 1000

  def self.find input, n
    Finder.new.find input, n
  end

  class Finder

    public

      def find input, n
        reset_instance

        # line nember startng from 1
        line = 1
        # position of the line
        pos  = 1

        # iterate over each character
        # (encoding goes to fuck itself)
        input.each_char do |c|

          if '0' <= c && c <= '9' then

            @current += c
            if @current.length > MAX_LEN then
              raise Error.new "#{line}:#{pos}: number exceeds 1000 characters"
              return []
            end

            pos += 1

          else

            number_end n

            # current character is not a number;
            # this will not work on old MacOS (< 9) where
            # line delimiter is \r only, but fuck them
            if c == "\n" then
              line += 1
              pos = 1
            else
              pos += 1
            end

          end # '0' <= c && c  <= '9'

        end # input.each_char

        # last number given
        number_end n

        @list # result

      end # find

    protected

      def number_end n
        # is there a match
        if @current.length > 0 then

          # Fort- or unfortunately Ruby doesn't
          # know about leading zero octal notation
          # (like 0644) using 0o644. Thus we can
          # avoid any check for this cases.
          cn = @current.to_i # to integer
          @current = ""      # reset the current

          # add the number to the list
          if @list.length == 0 then

            # the list is emty

            @list.push cn # first number in the list

          elsif @list.length < n then

            # the list is not full

            i = @list.bsearch_index { |x| x <= cn }
            # list[i] == cn #=> already exists
            # list[i] < cn  #=> not exists (insert)
            # i == nil      #=> not exists and lesser then any element

            if i == nil then
              @list.push cn # just add it to tail
            elsif @list[i] < cn then
              @list.insert i, cn # shifting some part of the array
            end

            # if i is not nil, and !(list[i] < cn) then list[i] == cn
            # (already exsit, do nothing properly)

          elsif @list.last < cn then

            # the list is full

            i = @list.bsearch_index { |x| x <= cn }

            # see above about the i == nil and list[i] == cn

            if i != nil && @list[i] < cn then

              # the cn is greater then the smallest element of the
              # list; let's insert it and pop last element

              @list.pop          # just got rid out of the last element
              @list.insert i, cn # insert the new big

            end

          end

          # if list.last is greateer then the cn,
          # and list.length is n, then we should
          # just drop the number, since it's not
          # a big one

        end # @current.length > 0

      end # number_end

      def reset_instance
        # the numebrs list is allways sorted and 
        # the last element is the smallest one;
        # (e.g. descending)
        #
        # TODO (kostyarin): use doubly-linked list
        # instead of the sorted array to avoid
        # the worst case where numbers goes from
        # the lowest to the highest (shifting the
        # array every time)
        #
        @list = []
        # curretn number matching
        @current = ""
      end

  end # class


end # module
