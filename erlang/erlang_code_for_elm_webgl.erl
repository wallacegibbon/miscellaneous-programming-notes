-module(erlang_code_for_elm_webgl).
-export([webgl_entity/4, simple_test/0]).
-export_type([mesh/1, shader/3, entity/0]).

%% This is just for describing the way that WebGL in Elm works, it not checked by dialyzer.

-type mesh(Attributes) ::
	{mesh1, render_info(), [Attributes]} |
	{mesh2, render_info(), [{Attributes, Attributes}]} |
	{mesh3, render_info(), [{Attributes, Attributes, Attributes}]} |
	{mesh_indexed_3, render_info(), [Attributes], [{integer(), integer(), integer()}]}.

-type render_info() :: #{mode := integer(), element_size := integer(), index_size := integer()}.

-type shader(_Attributes, _Uniforms, _Varyings) :: shader.
-type entity() :: entity.

default_render_info() ->
	#{mode => 4, element_size => 3, index_size => 1}.

-spec webgl_entity(shader(Attributes, Uniforms, Varyings), shader(none, Uniforms, Varyings), mesh(Attributes), Uniforms) -> entity().
webgl_entity(VertexShader, FragmentShader, Mesh, Uniforms) ->
	webgl_kernel:entity(VertexShader, FragmentShader, Mesh, Uniforms).

-type pos_3d() :: {float(), float(), float()}.
-type color() :: {float(), float(), float()}.

-type my_vertex() :: #{position := pos_3d(), color := color()}.
-type my_uniforms() :: #{offset_x := integer()}.
-type my_varyings() :: #{v_color := color()}.

-spec my_vertex_shader() -> shader(my_vertex(), my_uniforms(), my_varyings()).
my_vertex_shader() ->
	%% shader code here
	shader.

-spec my_fragment_shader() -> shader(none, my_uniforms(), my_varyings()).
my_fragment_shader() ->
	%% shader code here
	shader.

simple_test() ->
	Mesh1 = {mesh1, default_render_info(), [#{position => {0.3, 0.5, 0}, color => {0.5, 0.5, 0.5}}]},
	webgl_entity(my_vertex_shader(), my_fragment_shader(), Mesh1, #{offset_x => 0.2}).

