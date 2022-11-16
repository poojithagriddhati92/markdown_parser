require 'rails_helper'
require_relative '../../lib/markdown_parser/converter'

describe MarkdownParser::Converter do
  describe '.to_html' do
    subject { described_class.new(markdown_string) }

    context 'convert all valid tags' do
      let!(:markdown_string) do
        <<~'EOF'
          # Header one

          Hello there

          How are you?
          What's going on?

          ## Another Header

          This is a paragraph [with an inline link](http://google.com). Neat, eh?

          ## This is a header [with a link](http://yahoo.com)
        EOF
      end

      let!(:expected_response) do
        <<~'EOF'
          <h1>Header one</h1>

          <p>Hello there</p>

          <p>How are you?
          What's going on?</p>

          <h2>Another Header</h2>

          <p>This is a paragraph <a href="http://google.com">with an inline link</a>. Neat, eh?</p>

          <h2>This is a header <a href="http://yahoo.com">with a link</a></h2>
        EOF
      end

      it 'should converts all headers' do
        expect(subject.to_html).to eq(expected_response)
      end
    end

    context 'ignore newlines' do
      let!(:markdown_string) do
        <<~'EOF'
              


        EOF
      end

      let!(:expected_response) do
        <<~'EOF'
              


        EOF
      end

      it 'should converts all headers' do
        expect(subject.to_html).to eq(expected_response)
      end
    end

    context 'ignore if line starts with more than 6 #' do
      let!(:markdown_string) do
        <<~'EOF'
          ######### Header one
        EOF
      end

      let!(:expected_response) do
        <<~'EOF'
          ######### Header one
        EOF
      end

      it 'should converts all headers' do
        expect { subject.to_html }.to raise_error(StandardError)
      end
    end
  end
end
