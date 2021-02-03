FROM gitpod/workspace-full

ENV HOME=/home/gitpod
WORKDIR $HOME
USER gitpod
RUN rm -f ~/.rvmrc ~/.bashrc.d/70-ruby \
    && bash -lc " \
        rvm requirements \
        && rvm install 2.7.2 \
        && rvm use 2.7.2 --default \
        && rvm rubygems current \
        && gem install bundler --no-document" \
    && echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*' >> /home/gitpod/.bashrc.d/70-ruby \
    && echo "rvm_gems_path=/workspace/.rvm" > ~/.rvmrc

