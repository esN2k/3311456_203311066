import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/esen/chat/index.dart';
import '/esen/esen_theme.dart';
import '/esen/esen_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_main_model.dart';
export 'chat_main_model.dart';

class ChatMainWidget extends StatefulWidget {
  const ChatMainWidget({Key? key}) : super(key: key);

  @override
  _ChatMainWidgetState createState() => _ChatMainWidgetState();
}

class _ChatMainWidgetState extends State<ChatMainWidget> {
  late ChatMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatMainModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: EsenTheme.of(context).primary,
              ),
            ),
          );
        }
        final chatMainUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: EsenTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              context.pushNamed(
                'MyFriends',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.bottomToTop,
                    duration: Duration(milliseconds: 250),
                  ),
                },
              );
            },
            backgroundColor: EsenTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.add_comment_rounded,
              color: EsenTheme.of(context).tertiary,
              size: 30.0,
            ),
          ),
          appBar: AppBar(
            backgroundColor: EsenTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Text(
              'Tüm Chatleriniz',
              style: EsenTheme.of(context).displaySmall.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: EsenTheme.of(context).tertiary,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 4.0,
          ),
          body: SafeArea(
            child: StreamBuilder<List<ChatsRecord>>(
              stream: queryChatsRecord(
                queryBuilder: (chatsRecord) => chatsRecord
                    .where('users', arrayContains: currentUserReference)
                    .orderBy('last_message_time', descending: true),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        color: EsenTheme.of(context).primary,
                      ),
                    ),
                  );
                }
                List<ChatsRecord> containerChatsRecordList = snapshot.data!;
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final allChats = containerChatsRecordList.toList();
                        if (allChats.isEmpty) {
                          return Center(
                            child: EmptyListWidget(),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: allChats.length,
                          itemBuilder: (context, allChatsIndex) {
                            final allChatsItem = allChats[allChatsIndex];
                            return StreamBuilder<FFChatInfo>(
                              stream: FFChatManager.instance
                                  .getChatInfo(chatRecord: allChatsItem),
                              builder: (context, snapshot) {
                                final chatInfo =
                                    snapshot.data ?? FFChatInfo(allChatsItem);
                                return FFChatPreview(
                                  onTap: () => context.pushNamed(
                                    'chatDetails',
                                    queryParams: {
                                      'chatUser': serializeParam(
                                        chatInfo.otherUsers.length == 1
                                            ? chatInfo.otherUsersList.first
                                            : null,
                                        ParamType.Document,
                                      ),
                                      'chatRef': serializeParam(
                                        chatInfo.chatRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'chatUser':
                                          chatInfo.otherUsers.length == 1
                                              ? chatInfo.otherUsersList.first
                                              : null,
                                    },
                                  ),
                                  lastChatText: chatInfo.chatPreviewMessage(),
                                  lastChatTime: allChatsItem.lastMessageTime,
                                  seen: allChatsItem.lastMessageSeenBy!
                                      .contains(currentUserReference),
                                  title: chatInfo.chatPreviewTitle(),
                                  userProfilePic: chatInfo.chatPreviewPic(),
                                  color: EsenTheme.of(context)
                                      .secondaryBackground,
                                  unreadColor:
                                  EsenTheme.of(context).tertiaryOld,
                                  titleTextStyle: GoogleFonts.getFont(
                                    'Lexend Deca',
                                    color: EsenTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  dateTextStyle: GoogleFonts.getFont(
                                    'Lexend Deca',
                                    color:
                                    EsenTheme.of(context).grayIcon,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                  previewTextStyle: GoogleFonts.getFont(
                                    'Lexend Deca',
                                    color:
                                    EsenTheme.of(context).grayIcon,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12.0,
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          8.0, 3.0, 8.0, 3.0),
                                  borderRadius: BorderRadius.circular(0.0),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
