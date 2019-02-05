# ocp_on_osp_director

Usage is simple enough. Run `deploy.sh`

At the top of deploy.sh are a few variables that help customize the configuration. We can add to that, as well as fix glitches in the various documentation section scripts until we get a successful and repeatable run. At that point, this should encompass the majority of our work to verify the use case.

## Why bash?

I didn't want to go 3 rounds with the proper version of ansible for some
random syntax, so I kept it as simple as possible with a little bit of
bash scripting.
