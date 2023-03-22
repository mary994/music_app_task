// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MusicService implements MusicService {
  _MusicService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://ws.audioscrobbler.com/2.0/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<ArtistSearchResponse>> searchForArtist(artist,
      {apiKey = AppConst.kApiKey,
      format = 'json',
      method = 'artist.search'}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'artist': artist,
      r'api_key': apiKey,
      r'format': format,
      r'method': method
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<ArtistSearchResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ArtistSearchResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetTopAlbumsResponse>> getTopAlbums(mbid,
      {apiKey = AppConst.kApiKey,
      format = 'json',
      method = 'artist.gettopalbums'}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'mbid': mbid,
      r'api_key': apiKey,
      r'format': format,
      r'method': method
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetTopAlbumsResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetTopAlbumsResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetAlbumTracksResponse>> getAlbumTracks(mbid, artist,
      {apiKey = AppConst.kApiKey,
      format = 'json',
      method = 'album.getinfo'}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'mbid': mbid,
      r'artist': artist,
      r'api_key': apiKey,
      r'format': format,
      r'method': method
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetAlbumTracksResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetAlbumTracksResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
